# Darkokai 🌑
A dark variant of [oneKelvinSmith’s Monokai port](https://github.com/oneKelvinSmith/monokai-emacs) for Emacs. This came about as I had an ever-growing unorganised list of overrides and tweaks on Monokai which eventually began to emerge into it’s own style.

## Screenshots

![darkokai-elixir-preview](/../screenshots/elixir-example.png)

![darkokai-elisp-preview](/../screenshots/elisp-example.png)

![darkokai-android-preview](/../screenshots/android-example.png)

## Installation

Hopefully it’ll be up on [MELPA](https://melpa.org) soon, but in the meantime you can place `darkokai-theme.el` in your `custom-theme-load-path` and load the theme with `(load-theme 'darkokai t)`.

## Notes

Terminal support is there, but some of the base terminal colours still need to be updated to match the GUI colours. If the colours look particularly bad in terminal, make sure you’re using a 256 color term by adding the following to your `.zshrc` or `.bashrc`:

```bash
export TERM=xterm-256color`
```

## Additions and suggestions

Pull requests and suggestions for improvement are always welcome!
