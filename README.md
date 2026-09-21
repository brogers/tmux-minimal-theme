# 🎨 tmux-minimal-theme

> A clean, minimal, and highly customizable tmux theme with built-in system monitoring

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/binoymanoj/tmux-minimal-theme)](https://github.com/binoymanoj/tmux-minimal-theme/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/binoymanoj/tmux-minimal-theme)](https://github.com/binoymanoj/tmux-minimal-theme/issues)

## Status Line
![Status Line Screenshot](screenshots/status-line.png)

## Full Screen
![Full Screen Screenshot](screenshots/tmux-full.png)

## ✨ Features

- 🎯 **Minimal Design** - Clean and distraction-free interface
- 📊 **System Monitoring** - Built-in CPU, memory, battery, and time display
- 🎨 **Highly Customizable** - Easy color and component customization
- 🌈 **Multiple Color Schemes** - Catppuccin, Tokyo Night, Dracula, Gruvbox, Nordfox
- ⚡ **Lightweight** - Fast and efficient with minimal resource usage
- 🔧 **Easy Installation** - One-line installation with TPM

## 📸 Screenshots

### Default Theme (Catppuccin Mocha)
![Default Theme](screenshots/status-line.png)

<!-- ### Customization Examples -->
<!-- ![Customization](screenshots/customization.png) -->
<!---->
<!-- ### Features in Action -->
<!-- ![Features GIF](screenshots/features.gif) -->

## 🚀 Installation

### Prerequisites

- [tmux](https://github.com/tmux/tmux) (version 2.1 or higher)
- [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm)

### Using TPM (Recommended)

1. Add the plugin to your `~/.tmux.conf`:

```bash
set -g @plugin 'binoymanoj/tmux-minimal-theme'
```

2. Reload tmux configuration:

```bash
# Reload tmux config
tmux source-file ~/.tmux.conf
```

3. Install the plugin by pressing `prefix + I` (default prefix is `Ctrl-b`)

### Manual Installation

1. Clone the repository:

```bash
git clone https://github.com/binoymanoj/tmux-minimal-theme.git ~/.tmux/plugins/tmux-minimal-theme
```

2. Add to your `~/.tmux.conf`:

```bash
run-shell ~/.tmux/plugins/tmux-minimal-theme/minimal.tmux
```

3. Reload tmux configuration:

```bash
tmux source-file ~/.tmux.conf
```

## ⚙️ Configuration

### Basic Customization

Choose a built-in color scheme by setting one option in your `~/.tmux.conf`:

```bash
set -g @minimal_theme_colorscheme "catppuccin_mocha"
```

Valid values are `catppuccin_mocha` (default), `catppuccin_frappe`, `nordfox`,
`tokyonight`, `dracula`, and `gruvbox_dark`.

Set this option before the plugin is initialized (i.e. before the
`run '~/.tmux/plugins/tpm/tpm'` line). The scheme supplies values only for
colors you have not configured, so individual `@minimal_theme_*` color options
in `tmux.conf` take precedence within a single reload.

Switching `@minimal_theme_colorscheme` to a different scheme and reloading
(`tmux source-file ~/.tmux.conf`) resets all `@minimal_theme_*` color options,
including any manual overrides, so the newly selected scheme always applies
cleanly. If you both override individual colors and want them to survive a
colorscheme switch, re-apply the overrides after switching schemes.

### Status Bar Components

The status bar displays the following information:

- **Left**: Session name with icon
- **Window list**: Window index/name, plus a `+` indicator when a window is
  maximized/zoomed
- **Right**: Current directory, CPU usage, memory usage, date, time, battery
  percentage, and an optional hostname

The hostname is disabled by default; all other `status-right` fields are
enabled. Set these options before the plugin is initialized to change which
fields are shown:

```bash
set -g @minimal_theme_hostname_status "on"
set -g @minimal_theme_directory_status "off"
set -g @minimal_theme_cpu_status "off"
set -g @minimal_theme_memory_status "off"
set -g @minimal_theme_date_status "off"
set -g @minimal_theme_clock_status "off"
set -g @minimal_theme_battery_status "off"
```

Use `on` to show a field and `off` to hide it. Separators are added only between
enabled fields.

While the prefix key is active, the session name in `status-left` is highlighted
using the accent color as its background.

When copy mode is active, it uses the selection color as its background instead.
Copy-mode highlighting takes precedence when both states are active.

## 🎨 Customization Guide

### Overriding Individual Colors

For advanced customization, override individual theme colors in `~/.tmux.conf`:

```bash
# Your custom theme
set -g @minimal_theme_bg_color "#your-bg-color"
set -g @minimal_theme_active_color "#your-active-color"
set -g @minimal_theme_inactive_color "#your-inactive-color"
set -g @minimal_theme_text_color "#your-text-color"
set -g @minimal_theme_accent_color "#your-accent-color"
set -g @minimal_theme_border_color "#your-border-color"
set -g @minimal_theme_selection_color "#your-selection-color"
```

`@minimal_theme_selection_color` controls both the `status-left` copy-mode
highlight and the copy-mode selection background.

Reload tmux configuration after changing these options:

```bash
tmux source-file ~/.tmux.conf
```

### Advanced Customization

For more advanced customization options, see [CUSTOMIZATION.md](docs/CUSTOMIZATION.md).

## 🔧 Troubleshooting

### Theme not loading

1. Ensure TPM is installed and working:

```bash
ls ~/.tmux/plugins/
```

2. Check if the plugin is listed:

```bash
tmux show-options -g | grep @plugin
```

3. Reload tmux configuration:

```bash
tmux source-file ~/.tmux.conf
```

### System information not showing

The theme requires some system commands to display information:

- **CPU**: `/proc/stat` (Linux systems)
- **Memory**: `free` command (install `procps` on some systems)
- **Battery**: `/sys/class/power_supply/` directory (Linux systems)

### Colors not displaying correctly

1. Ensure your terminal supports 256 colors:

```bash
echo $TERM
```

2. Add to your `~/.tmux.conf`:

```bash
set -g default-terminal "tmux-256color"
set-option -sa terminal-features ',xterm-256color:RGB'
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup

1. Fork the repository
2. Clone your fork:

```bash
git clone https://github.com/binoymanoj/tmux-minimal-theme.git
```

3. Create a feature branch:

```bash
git checkout -b feature/your-feature
```

4. Make your changes and test them
5. Submit a pull request

### Adding New Color Schemes

To add a new color scheme:

1. Add your color definitions to `scripts/color-variants.sh`
2. Update the README.md with the new scheme
3. Add a screenshot to the `screenshots/` directory

## 📝 Changelog

See [CHANGELOG.md](docs/CHANGELOG.md) for a detailed history of changes.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by various tmux themes in the community
- Color schemes adapted from popular themes like Catppuccin, Tokyo Night, etc.
- Thanks to all contributors and users

## 📞 Support

- 🐛 [Report Bug](https://github.com/binoymanoj/tmux-minimal-theme/issues)
- 💡 [Request Feature](https://github.com/binoymanoj/tmux-minimal-theme/issues)
- 💬 [Discussions](https://github.com/binoymanoj/tmux-minimal-theme/discussions)

---

<div align="center">

**[⬆ Back to Top](#-tmux-minimal-theme)**

Made with ❤️ by [Binoy Manoj](https://github.com/binoymanoj)

⭐ Star this repo if you find it helpful!

</div>
