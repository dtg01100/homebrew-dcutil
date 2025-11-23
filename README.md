# Homebrew Tap for dcutil

This is the official Homebrew tap for [dcutil](https://github.com/dtg01100/dcutil), a comprehensive devcontainer utility script.

## Installation

```bash
brew tap dtg01100/homebrew-dcutil
brew install dcutil
```

## What is dcutil?

dcutil is a complete Devcontainer Specification implementation providing 100% compliance with advanced features for managing development containers. It supports Docker and Podman backends, intelligent auto-completion, and extensive lifecycle management.

For more information, see the [main repository](https://github.com/dtg01100/dcutil).

## Tab Completion

This Homebrew formula includes tab completion for both bash and zsh:

### Bash
If you have bash-completion installed, dcutil completion will be automatically available.

### Zsh
Zsh completion is installed and will be available automatically if you're using the zsh shell.

Alternatively, you can use the built-in completion generation feature:
```bash
# Generate bash completion
dcutil completion bash > /path/to/completions/bash/dcutil

# Generate zsh completion
dcutil completion zsh > /path/to/completions/zsh/_dcutil
```

## Usage

After installation, use `dcutil` commands to manage your devcontainers:

```bash
dcutil up          # Start devcontainer
dcutil enter       # Enter container
dcutil help        # Show help
```

## Contributing

Issues and pull requests for the formula should be filed in this tap repository. For dcutil itself, use the [main repository](https://github.com/dtg01100/dcutil).