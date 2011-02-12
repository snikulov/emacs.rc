;; el-get
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "dv")
(add-to-list 'load-path "~/emacs.rc/el-get/")
(require 'el-get)
(setq el-get-recipe-path  '("~/emacs.rc/el-get/recipes/"))
(setq el-get-sources '(color-theme cmake-mode magit psvn
    ergoemacs-keybindings ahg auto-complete yasnippet))
(el-get 'sync)

(ergoemacs-mode 1)

(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-renegade)
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
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "cyan3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 119 :width normal :foundry "unknown" :family "Droid Sans Mono")))))
