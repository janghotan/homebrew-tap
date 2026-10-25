# homebrew-tap

Homebrew tap for [rewind](https://github.com/janghotan/rewind).

## Installation

```bash
brew tap janghotan/tap
brew install rewind
```

Or install directly in one step:

```bash
brew install janghotan/tap/rewind
```

## Shell Integration

Shell completions for Bash, Zsh, and Fish are installed automatically by Homebrew into standard completion directories.

Command interception hooks (`rm`, `mv`, `cp`, `chmod`, `chown`, and destructive `git`) must be explicitly enabled in your shell startup file:

### Bash (`~/.bashrc`)

```bash
echo 'eval "$(rewind init bash)"' >> ~/.bashrc
```

### Zsh (`~/.zshrc`)

```bash
echo 'eval "$(rewind init zsh)"' >> ~/.zshrc
```

### Fish (`~/.config/fish/config.fish`)

```bash
echo 'rewind init fish | source' >> ~/.config/fish/config.fish
```
