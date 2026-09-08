# Modded-ubuntu-termux

🐧 Modded-ubuntu-termux sets up a customized Ubuntu 24.04 environment inside Termux via proot-distro. Goes beyond a vanilla install with optional mods: full XFCE desktop + VNC, dev tools (Python, Node, build-essential), themed shell (Zsh + Starship), and other tweaks — all through one simple script.

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![Platform](https://img.shields.io/badge/platform-Termux-brightgreen)
![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-orange)

## Features

- 📦 One-command Ubuntu 24.04 install via `proot-distro`
- 🖥️ Optional XFCE desktop + VNC server
- 🛠️ Dev tools mod: Python3, Node.js, build-essential, Git
- 🐚 Custom shell: Zsh + Starship prompt
- ⚙️ Modular `mods/` system — enable only what you need
- 🚀 Simple launcher script

## Requirements

- [Termux](https://f-droid.org/en/packages/com.termux/) (F-Droid build recommended)
- ~2-3 GB free storage
- Android 7+

## Installation

```bash
pkg install git -y
git clone https://github.com/themangodeveloper-eng/Modded-ubuntu-termux.git
cd Modded-ubuntu-termux
chmod +x install.sh mods/*.sh start-ubuntu.sh
./install.sh
```

## Usage

Launch your modded Ubuntu anytime with:

```bash
./start-ubuntu.sh
```
## Mods

| Mod | Description |
|---|---|
| `desktop.sh` | Installs XFCE4 + TigerVNC for a full GUI desktop |
| `devtools.sh` | Installs Python3, Node.js, npm, build-essential |
| `shell.sh` | Installs Zsh + Starship prompt with custom config |
| `extras.sh` | Extra CLI utilities (nano, htop, etc.) |

## Uninstall / Reset

```bash
proot-distro reset ubuntu   # wipes Ubuntu, keeps it installed
proot-distro remove ubuntu  # fully removes Ubuntu
```
## Errors

Errors

If you encounter an error while installing or running Modded Ubuntu Termux:

1. Make sure Termux is updated.
2. Make sure you have enough storage space.
3. Check that the required files are present.
4. Run the installer again if an installation was interrupted.
5. Copy the error message and report it in the GitHub Issues section.

Common errors

"Permission denied"

chmod +x install.sh start-ubuntu.sh

"No such file or directory"

Make sure you are inside the project directory:

cd Modded-ubuntu-termux

Then run:

./install.sh

Still not working?

Please include the complete error message when reporting the problem. This makes it easier to identify and fix the issue.

## Mods
desktop
```bash
./mods/desktop.sh
```
devtools
```
./mods/devtools.sh
```
```bash
./mods/extras.sh
```
```bash
./mods/shell.sh
```

## Disclaimer

This project runs Ubuntu in a userspace container (`proot-distro`) — it is **not** a full virtualized environment. Some features (systemd, raw sockets, certain kernel modules) will not work. Use at your own risk.

## License

This project is licensed under the **GNU General Public License v3.0** — see the [LICENSE](LICENSE) file for details.

## Contributing

Pull requests welcome! Feel free to open an issue for bugs, feature requests, or new mods.

---

Made with 🐧 by [@themangodeveloper-eng](https://github.com/themangodeveloper-eng)
