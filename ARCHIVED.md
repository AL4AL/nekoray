# This repository is archived

**AL4AL/nekoray** is no longer maintained as a product.

## Successor

Use **[AL4AL/Throne](https://github.com/AL4AL/Throne)** — a fork of [throneproj/Throne](https://github.com/throneproj/Throne) that continues desktop development (Windows / macOS / Linux) and absorbs useful work from this Nekoray fork and other open clients.

Existing releases and git history remain available for reference. Do not expect new builds or bugfixes here.

## Why

- Upstream [MatsuriDayo/nekoray](https://github.com/MatsuriDayo/nekoray) is archived; the MatsuriDayo sing-box pin is a dead end for modern protocols.
- [Throne](https://github.com/throneproj/Throne) is the maintained Nekoray-lineage desktop client (Qt6, broader protocol set, dual sing-box/Xray, headless, packaging).
- Continuing two desktop codebases dilutes effort. New work goes into Throne.

## What this fork contributed (preserve as reference)

These improvements remain in the git history and releases; the Throne fork aims to carry forward the important ones:

| Area | Notes |
|---|---|
| XHTTP / splitHTTP | Share-link import/export (`type=xhttp\|splithttp`, `mode`, `path`, `host`, `extra`, `pcs`/`pinSHA256`); edit UI; sing-box port with **Xray-compatible** HTTP version selection and `certificate_sha256` pinning |
| Legacy profiles | Startup repair (`splithttp`→`xhttp`, `h2`→`http`, empty→`tcp`); unsupported transports quarantined to `profiles_removed/` |
| Subscriptions | Huge-list progress UX; body sanitization for embedded NUL/binary junk; finish-path performance |
| Packaging / install | Debian root-owned payload, hicolor icons, desktop `StartupWMClass`; gentle migration from configs next to old binaries; appdata fallback when `/opt` is unwritable |
| CI / updates | Fixed Linux+Windows release workflow; in-app update check pointed at this fork |

See [CHANGELOG.md](CHANGELOG.md) for version-level detail.

## License

Unchanged; see [LICENSE](LICENSE).
