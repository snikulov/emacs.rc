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

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))
(require 'el-get)

(setq my-packages
       '(ergoemacs-keybindings cmake-mode magit yasnippet auto-complete cmake-mode color-theme))

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

;; default coding style
(setq c-default-style "bsd"
      c-basic-offset 4
      indent-tabs-mode nil)

(setq c++-default-style "bsd"
      c++-basic-offset 4
      indent-tabs-mode nil)

(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-euphoria)

(when (equal system-type 'gnu/linux)
  (set-face-attribute 'default nil :family "Droid Sans Mono" :height 142)
)
;; cedet
;;(load "~/.emacs.d/conf/conf-cedet.el")
(require 'yasnippet)
(yas/reload-all)
