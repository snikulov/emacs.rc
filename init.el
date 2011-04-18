;; common lisp enable for cedet
(require 'cl)
;; el-get
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "dv")

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


(add-to-list 'load-path "~/emacs.rc/el-get/")
(require 'el-get)
(setq el-get-recipe-path  '("~/emacs.rc/el-get/recipes/"))
(setq el-get-sources '(delsel color-theme cmake-mode magit psvn
    ergoemacs-keybindings ahg yasnippet auto-complete))
(el-get 'sync)

(ergoemacs-mode 1)


;; gtags on Fedora
(setq load-path (cons "/usr/share/gtags" load-path))
(autoload 'gtags-mode "gtags" "" t)

(setq c-mode-hook '(lambda () (gtags-mode 1)))
(setq c++-mode-hook '(lambda () (gtags-mode 1)))
(setq c-mode-hook '(lambda () (global-linum-mode 1)))
(setq c++-mode-hook '(lambda () (global-linum-mode 1)))

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

(set-face-attribute 'default nil :height 142)
(global-set-key (kbd "<C-M-down>") 'text-scale-decrease)
(global-set-key (kbd "<C-M-up>") 'text-scale-increase)

(when (equal system-type 'gnu/linux)
  (set-face-font 'default nil :family "Droid Sans Mono")
)




