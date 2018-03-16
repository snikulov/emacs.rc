;; set ergoemacs-mode by default
;;(setq ergoemacs-theme nil)
;;(setq ergoemacs-keyboard-layout "dv")
;;(require 'ergoemacs-mode)
;;(ergoemacs-mode 1)

;; open keyboard shortcut image with F8 key
;;(global-set-key (kbd "<f8>")
;;		(lambda ()
;;		  (interactive)
;;		  (find-file "~/.emacs.d/emacs_kb_dv.png")))

(require 'neotree)

;; set custom keybindings
(global-set-key [C-M-down] 'text-scale-decrease)
(global-set-key [C-M-up] 'text-scale-increase)
(global-set-key [f5] 'goto-line)
(global-set-key [C-M-tab] 'clang-format-region)
(global-set-key [f8] 'neotree-toggle)
