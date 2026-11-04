# 🔥 Tarignite

**Right-click a `.tar.gz`. Click "Install this app". Done.**

Tarignite is a one-click installer for prebuilt Linux apps that only come as a tar archive. It extracts the app, finds the right program to run, and adds it to your application menu. No terminal work, no `sudo`, no hunting through `.dll` files.

Built for **Linux Mint (Cinnamon / Nemo)**.

[![License: MIT](https://img.shields.io/github/license/IvanFieryPrince/tarignite)](LICENSE)
[![Stars](https://img.shields.io/github/stars/IvanFieryPrince/tarignite?style=social)](https://github.com/IvanFieryPrince/tarignite/stargazers)

## Quick install

Paste this into a terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/IvanFieryPrince/tarignite/main/get.sh | bash
```

Prefer to read the code first? Clone it instead:

```bash
git clone https://github.com/IvanFieryPrince/tarignite.git
cd tarignite
./install.sh
```

The installer asks for your password only if `zenity`, `file` or `tar` are missing. It restarts Nemo at the end, so open file windows will close.

## Use it

1. Open **Files** (Nemo).
2. Right-click a `.tar.gz`, `.tgz`, `.tar.xz` or `.tar.bz2` file.
3. Click **Install this app**.

The app now appears in your Menu. You can also run it from a terminal:

```bash
tarignite ~/Downloads/app-1.0-linux-x64.tar.gz
```

## How it works

1. Extracts the archive to `~/.local/opt/<name>`.
2. Picks the main program: the executable named like the app, or the only one at the top level. Helpers such as sandboxes, crash handlers and updaters are ignored.
3. Finds an icon inside the app folder.
4. Creates a launcher in `~/.local/share/applications`.

If it genuinely cannot tell which program to run, it shows a short list of real programs to pick from (never library files).

## Remove an app

```bash
tarignite --remove "AppName"
```

## Uninstall Tarignite

Remove your apps first (above), then:

```bash
cd tarignite && ./uninstall.sh
```

Or, if you installed with the one-liner, delete these two files:

```bash
rm ~/.local/bin/tarignite ~/.local/share/nemo/actions/tarignite.nemo_action
```

## Limitations

- Works for **prebuilt** apps (Blender, Filee and similar). Source-code tarballs are detected and left extracted, with a message.
- Apps that need their own setup step (for example Tor Browser's `--register-app`) may need extra manual steps.
- Linux Mint Cinnamon with Nemo only. Other file managers use different action formats.
- Upgrades are manual: installing a newer archive of the same app replaces the old folder.
- Tarignite runs nothing during install, but launching the app runs whatever the archive contains. Only install archives from sources you trust.

## Like it?

If Tarignite saved you time, **[give it a star ⭐](https://github.com/IvanFieryPrince/tarignite)** so other Linux Mint users can find it.

Bugs and ideas are welcome in [Issues](https://github.com/IvanFieryPrince/tarignite/issues).

## License

[MIT](LICENSE) © Ivan DQ Balendra
