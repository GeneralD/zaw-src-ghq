# zaw-src-ghq

A zsh plugin providing a [zaw](https://github.com/zsh-users/zaw) source for
[ghq](https://github.com/motemen/ghq): incrementally filter your local
ghq-managed repositories, then cd into, browse (open in browser), or remove
the selected repo.

## Stack

- Pure zsh script — no build system, no tests, no CI
- Runtime deps: `zaw` (must be loaded first), `ghq`, `jq` (only for the
  ionicjs browse case), `hub` (GitHub browse), a Nerd Font for glyphs
- License: Apache-2.0

## Layout

- `zaw-src-ghq.plugin.zsh` — entry point; sources every `src/*.zsh` after
  checking `zaw-register-src` exists
- `src/ghq.zsh` — the actual source: `zaw-src-ghq` (candidates = `ghq list`)
  plus actions `zaw-src-ghq-cd` / `zaw-src-ghq-browse` / `zaw-src-ghq-remove`,
  registered via `zaw-register-src -n ghq`

## Status

Small, stable legacy plugin (single source file). No run/build command —
install via zplug or oh-my-zsh custom plugins as described in README.md.
