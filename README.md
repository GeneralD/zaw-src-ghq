# zaw-src-ghq

![shell](https://img.shields.io/badge/shell-zsh-blue) ![type](https://img.shields.io/badge/type-zaw%20source-blue) ![deps](https://img.shields.io/badge/deps-ghq%20%7C%20jq-blue) ![license](https://img.shields.io/badge/license-Apache--2.0-green)

![zaw-src-ghq — fuzzy-pick your ghq-managed repos from zsh](assets/hero.jpg)

Optional sources of [zaw](https://github.com/zsh-users/zaw) for [ghq](https://github.com/motemen/ghq):

- ghq

It shows list of your local repos managed by ghq, then cd, remove or browse repo you choose.

## Installation

If you are using zplug, just add the code below in your .zshrc.

```zsh
zplug "zsh-users/zaw"
zplug "GeneralD/zaw-src-ghq", on:zsh-users/zaw, defer:2
```

For oh-my-zsh, clone this repo into ~/.oh-my-zsh/custom/plugins and add plugin as below.

```zsh
plugins+=(zaw zaw-src-ghq)
```

## Dependencies

- ghq
- jq

If you are using macOS, you can install with,

```sh
brew install ghq jq
```

- any nerd-font

This zaw source shows characters of nerd-font.
You can search compatible font with,

```sh
brew cask search nerd-font
```

Then, install and set any nerd-font to your terminal application.
