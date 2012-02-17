;;(load "~/.emacs.d/el-get-install.el")

;; common lisp enable for cedet
(require 'cl)

;; set environment for ErgoEmacs - Dvorak keyboard layout
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "dv")

;; http://stackoverflow.com/questions/1817257/how-to-determine-operating-system-in-elisp
;; ;; it's better to store platform as symbol, not as several symbols
(setq windows nil mac nil linux nil)
(cond
  ((eq system-type 'windows-nt) (setq windows t))
  ((eq system-type 'darwin) (setq mac t))
  (t (setq linux t)))

(setq platform (cond
  ((eq system-type 'windows-nt) 'windows) ;; should also handle 'cygwin?
  ((eq system-type 'darwin) 'mac)
  (t 'linux)))

;; hide all menus, toolbars and scrollbars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'el-get)

(when (equal platform 'linux)
  (setq my-packages
       '(ergoemacs-keybindings yasnippet auto-complete org-mode))
)

(when (equal platform 'windows)
  (setq my-packages
       '(ergoemacs-keybindings auto-complete color-theme cmake-mode))
)

(el-get 'sync my-packages)

(load "~/.emacs.d/conf/conf-keyboard.el")
;;(load "~/.emacs.d/conf/emacs-rc-common-hooks.el")
(load "~/.emacs.d/conf/emacs-rc-auto-insert.el")
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

(when (equal platform 'linux)
  (set-face-attribute 'default nil :family "Droid Sans Mono" :height 142)
)
(when (equal platform 'windows)
  (set-face-attribute 'default nil :family "Consolas" :height 143)
)

(when (equal platform 'linux)
  (require 'yasnippet)
  (yas/load-directory "~/.emacs.d/snippets")
  (yas/reload-all)
)


