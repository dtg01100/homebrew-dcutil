# Update Formula Workflow - How It Works

## Overview
This workflow automatically updates the Homebrew formula when new releases of dcutil are published.

## How It Works

### Automatic Mode (Current Implementation)
The workflow can be triggered by a `repository_dispatch` event with an empty or missing payload. In this case:

1. The workflow fetches the latest release from the GitHub API
2. Downloads the release tarball and calculates SHA256
3. Updates `Formula/dcutil.rb` with the new URL and SHA256
4. Commits and pushes the changes

### Manual Trigger
You can manually trigger the workflow using GitHub API (note: the workflow uses `repository_dispatch`, not `workflow_dispatch`):

```bash
# Using GitHub CLI (requires authentication)
gh api repos/dtg01100/homebrew-dcutil/dispatches \
  -f event_type='update-formula' \
  -f client_payload[version]='v1.6.0'

# Without version (will auto-fetch latest)
gh api repos/dtg01100/homebrew-dcutil/dispatches \
  -f event_type='update-formula'

# Using curl directly
curl -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/dtg01100/homebrew-dcutil/dispatches \
  -d '{"event_type":"update-formula","client_payload":{"version":"v1.6.0"}}'
```

## Recommended: Auto-Trigger from dcutil Repository

For fully automated releases, add this workflow to the `dtg01100/dcutil` repository at `.github/workflows/update-homebrew.yml`:

```yaml
name: Update Homebrew Formula

on:
  release:
    types: [published]

jobs:
  update-homebrew:
    runs-on: ubuntu-latest
    steps:
      - name: Trigger Homebrew Formula Update
        run: |
          curl -X POST \
            -H "Authorization: token ${{ secrets.HOMEBREW_TAP_TOKEN }}" \
            -H "Accept: application/vnd.github.v3+json" \
            https://api.github.com/repos/dtg01100/homebrew-dcutil/dispatches \
            -d "{\"event_type\":\"update-formula\",\"client_payload\":{\"version\":\"${{ github.event.release.tag_name }}\"}}"
```

### Setup Instructions for Auto-Trigger

1. Create a Personal Access Token (PAT) with `repo` scope
2. Add it to dtg01100/dcutil repository secrets as `HOMEBREW_TAP_TOKEN`
3. Add the workflow file above to dtg01100/dcutil repository
4. Future releases will automatically trigger the formula update

## Fallback Behavior

If the `repository_dispatch` payload doesn't include a version, the workflow will:
1. Query GitHub API for the latest release
2. Extract the tag name
3. Use that version for the update

This ensures the workflow always works even without the auto-trigger setup.

## Error Handling

The workflow includes validation for:
- Empty version (tries to fetch latest)
- Failed tarball download (checks for empty file hash)
- Missing release (exits with error message)
