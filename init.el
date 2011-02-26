;; el-get
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "dv")

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


(add-to-list 'load-path "~/emacs.rc/el-get/")
(require 'el-get)
(setq el-get-recipe-path  '("~/emacs.rc/el-get/recipes/"))
(setq el-get-sources '(color-theme cmake-mode magit psvn
    ergoemacs-keybindings ahg yasnippet auto-complete remember))
(el-get 'sync)

(ergoemacs-mode 1)


;; gtags on Fedora
(setq load-path (cons "/usr/share/gtags" load-path))
(autoload 'gtags-mode "gtags" "" t)

(setq c-mode-hook '(lambda () (gtags-mode 1)))
(setq c++-mode-hook '(lambda () (gtags-mode 1)))
(setq c-mode-hook '(lambda () (global-linum-mode 1)))
(setq c++-mode-hook '(lambda () (global-linum-mode 1)))

(setq c-default-style "bsd"
      c-basic-offset 4
      indent-tabs-mode nil)

(setq c++-default-style "bsd"
      c++-basic-offset 4
      indent-tabs-mode nil)

(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-euphoria)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "cyan3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 142 :width normal :foundry "unknown" :family "Droid Sans Mono")))))




