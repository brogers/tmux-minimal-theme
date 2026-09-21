# Advanced Customization Guide

## Status Bar Segments

### Left Status Bar

The left status bar shows the session name with an icon. You can customize it by overriding the tmux option:

```bash
# Custom left status
tmux set-option -g status-left "#[fg=your-color,bold] 🚀 #S #[fg=separator-color]│ "
```

### Right Status Bar

The right status bar contains configurable segments. The hostname is
disabled by default; all other segments are enabled. Set these options before
the plugin is initialized to change which segments are shown:

```bash
set -g @minimal_theme_hostname_status "on"
set -g @minimal_theme_directory_status "off"
set -g @minimal_theme_cpu_status "off"
set -g @minimal_theme_memory_status "off"
set -g @minimal_theme_date_status "off"
set -g @minimal_theme_clock_status "off"
set -g @minimal_theme_battery_status "off"
```

Use `on` to show a segment and `off` to hide it.

### Toggle Status Bar Keybind

By default, `prefix + b` toggles the status bar on/off. You can rebind this:

```bash
set -g @minimal_theme_toggle_status_key "t"
```

### Custom Icons

You can replace the default icons:

```bash
# Session icon
set -g @minimal_theme_session_icon " "

# Directory icon  
set -g @minimal_theme_dir_icon " "

# CPU icon
set -g @minimal_theme_cpu_icon " "

# Memory icon
set -g @minimal_theme_memory_icon " "

# Clock icon
set -g @minimal_theme_clock_icon " "

# Battery icon
set -g @minimal_theme_battery_icon " "

# Maximized/zoomed window indicator
set -g @minimal_theme_zoomed_icon "+"
```

### Window Status Customization

```bash
# Custom window status format
set -g window-status-format "#[fg=$inactive_color] #I #W "
set -g window-status-current-format "#[fg=$active_color,bold] #I #W "

# Add window flags
set -g window-status-format "#[fg=$inactive_color] #I:#W#F "
set -g window-status-current-format "#[fg=$active_color,bold] #I:#W#F "
```

### Pane Styling

```bash
# Custom pane border colors
set -g pane-border-style "fg=#your-border-color"
set -g pane-active-border-style "fg=#your-active-color,bold"

# Display pane numbers
set -g display-panes-colour "#your-inactive-color"
set -g display-panes-active-colour "#your-active-color"
```

### Clock Mode

```bash
# 12-hour format
set -g clock-mode-style 12

# Custom clock color
set -g clock-mode-colour "#your-clock-color"
```
