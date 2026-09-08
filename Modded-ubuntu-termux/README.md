# Modded-ubuntu-termux

🐧 **Modded-ubuntu-termux** sets up a customized Ubuntu environment inside Termux using `proot-distro`.

It provides optional modules for development tools, Zsh + Starship, XFCE + TigerVNC, and useful CLI utilities.

## Features

- 📦 Ubuntu installation through `proot-distro`
- 🛠️ Python, Node.js, npm, Git, build-essential and more
- 🐚 Zsh + Starship
- 🖥️ Optional XFCE desktop + TigerVNC
- ⚙️ Modular `mods/` system
- 🚀 Simple launcher

## Requirements

- Termux (F-Droid build recommended)
- Android 7+
- About 2–3 GB free storage depending on selected mods

## Installation

```bash
pkg install git -y
git clone https://github.com/themangodeveloper-eng/Modded-ubuntu-termux.git
cd Modded-ubuntu-termux
chmod +x install.sh start-ubuntu.sh mods/*.sh
./install.sh
```

## Usage

```bash
./start-ubuntu.sh
```

## Mods

| Mod | Description |
|---|---|
| `devtools.sh` | Python, pip, venv, Node.js, npm, build-essential, Git and tools |
| `shell.sh` | Zsh + Starship |
| `desktop.sh` | XFCE4 + TigerVNC |
| `extras.sh` | Extra CLI utilities |

## Desktop

After installing the desktop mod, enter Ubuntu and run:

```bash
vncserver :1 -localhost no
```

Connect to the VNC server using a VNC client.

To stop it:

```bash
vncserver -kill :1
```

## Reset / Uninstall

Reset the Ubuntu filesystem:

```bash
proot-distro reset ubuntu
```

Remove Ubuntu completely:

```bash
proot-distro remove ubuntu
```

## Disclaimer

This project runs Ubuntu in a userspace environment using `proot-distro`. It is not a full virtual machine. Some system-level features, including systemd and certain kernel functionality, are unavailable or behave differently.

Use at your own risk.

## License

GNU General Public License v3.0. See `LICENSE`.

## Contributing

Pull requests and issues are welcome.

---

Made with 🐧 by [@themangodeveloper-eng](https://github.com/themangodeveloper-eng)
