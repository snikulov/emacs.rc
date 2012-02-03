;;(load "~/.emacs.d/el-get-install.el")

;; common lisp enable for cedet
(require 'cl)

;; set environment for ErgoEmacs - Dvorak keyboard layout
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "dv")

;; hide all menus, toolbars and scrollbars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'el-get)

(setq my-packages
       '(ergoemacs-keybindings auto-complete color-theme cmake-mode))

(el-get 'sync my-packages)

(load "~/.emacs.d/conf/conf-keyboard.el")
;;(load "~/.emacs.d/conf/emacs-rc-common-hooks.el")
;;(load "~/.emacs.d/conf/emacs-rc-auto-insert.el")
;;(load "~/.emacs.d/conf/emacs-rc-ccmode.el")
(load "~/.emacs.d/conf/conf-gtags.el")

;; cmake mode hook
(require 'cmake-mode)
(setq auto-mode-alist
	(append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
		auto-mode-alist))

;; nuke trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; additional ws options
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(setq-default indent-tabs-mode nil)

;; default coding style
(setq c-default-style "bsd"
      c-basic-offset 4
      indent-tabs-mode nil)

(setq c++-default-style "bsd"
      c++-basic-offset 4
      indent-tabs-mode nil)

(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-euphoria)

(when (equal system-type 'gnu/linux)
  (set-face-attribute 'default nil :family "Droid Sans Mono" :height 142)
)
(when (equal system-type 'windows-nt)
  (set-face-attribute 'default nil :family "Consolas" :height 143)
)

;; cedet
;;(load "~/.emacs.d/conf/conf-cedet.el")
;;(require 'yasnippet)
;;(yas/reload-all)
