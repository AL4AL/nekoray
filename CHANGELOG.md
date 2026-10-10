# Changelog

All notable changes in this fork (base: upstream `MatsuriDayo/nekoray` 4.0.1, which is archived and read-only since 2025-03-17).

## 4.1.2 — 2026-10-06

- **XHTTP legacy-config repair at startup**: profiles stored with old stream names (`splithttp`, `h2`, empty) are renamed automatically; profiles using transports the core cannot run (e.g. `kcp`) are moved to `config/profiles_removed/` with a log notice instead of failing activation with `LoadConfig return error`. Re-import their share links to restore them.
- **In-app update check now points at this fork** (`AL4AL/nekoray` releases) — the upstream check was dormant since the archive. Assets are matched by name (`linux64`/`windows64`) and compared against the running version.
- **Docs/packaging cleanup**: removed the broken AUR-publish workflow (targeted a package that no longer exists), AUR/AppImage references corrected.
- **CI**: Windows builds moved to the `windows-2025` runner; CMake 4 compatibility for older third-party deps (`-DCMAKE_POLICY_VERSION_MINIMUM=3.5`).

## 4.1.1 — 2026-10-05

- **Gentle migration from older installs** (upstream #1534, #341):
  - first run imports profiles/groups/routes left next to older binaries into `~/.config/nekoray/` (originals kept, never overwrites);
  - an unwritable install dir (deb/AppImage under `/opt`) falls back to appdata instead of failing to start;
  - stable desktop identity (`nekoray.desktop` / WM_CLASS) fixes the missing icon on Wayland;
  - stale `nekobox` autostart entries are handled correctly.
- **Debian packaging** for Ubuntu 24.04 / modern apt: root-owned payload, hicolor-theme icons, dpkg-owned desktop entry.

## 4.1.0 — 2026-10-05

- **XHTTP (splitHTTP) transport support**:
  - share-link import/export (`type=xhttp|splithttp`, `mode`, `path`, `host`, `extra`, `pcs`/`pinSHA256`);
  - edit-dialog fields with correct visibility per network type;
  - sing-box core transport ported from hiddify-sing-box with **Xray-compatible behavior**: HTTP-version selection rule (`no TLS ⇒ 1.1`, `ALPN ≠ 1 entry ⇒ 2`, `["http/1.1"] ⇒ 1.1`) and `certificate_sha256` pinning for self-signed servers (`pcs` / `pinnedPeerCertificateChainSha256`);
  - `extra` JSON normalized both directions (Xray camelCase ↔ core snake_case); mux is disabled for xhttp (it has its own `xmux`).
- **Build fix**: `FindProtobuf` fallback when CMake config is absent (Debian/Ubuntu `libprotobuf-dev`).
- **CI**: release workflow modernized for current GitHub runners; release artifacts: `.deb`, `linux64.zip`, `windows64.zip`, `AppImage`.
