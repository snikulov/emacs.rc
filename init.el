;;;
;;; Initialization of Emacs
;;;

;;;
;;; disable scroll, tool, menu bars
;;;
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;;
;;; Initialize gtags and modes
;;;
(setq load-path (cons "/usr/share/gtags" load-path))
(autoload 'gtags-mode "gtags" "" t)

(setq c-mode-hook '(lambda () (gtags-mode 1)))
(setq c++-mode-hook '(lambda () (gtags-mode 1)))

;;;
;;; set color theme
;;;
(require 'color-theme)
(color-theme-initialize)
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
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "#00ff00" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 142 :width normal :foundry "unknown" :family "Droid Sans Mono")))))
