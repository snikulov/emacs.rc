;;;
;;; Initialization of Emacs
;;;

;;; Initialize gtags
(setq load-path (cons "/usr/share/gtags" load-path))
(autoload 'gtags-mode "gtags" "" t)

(setq c-mode-hook
      '(lambda ()
	      (gtags-mode 1)
))

(setq c++-mode-hook
      '(lambda ()
	      (gtags-mode 1)
))

;;;
;;; set color theme
;;;
(require 'color-theme)
(color-theme-initialize)
(color-theme-euphoria)
