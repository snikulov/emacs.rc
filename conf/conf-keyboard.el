;; set ergoemacs-mode by default
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "dv")
(require 'ergoemacs-mode)
(ergoemacs-mode 1)

;; open keyboard shortcut image with F8 key
(global-set-key (kbd "<f8>")
		(lambda ()
		  (interactive)
		  (find-file "~/.emacs.d/ergoemacs_dv.png")))

;; set custom keybindings
(global-set-key (kbd "<C-M-down>") 'text-scale-decrease)
(global-set-key (kbd "<C-M-up>") 'text-scale-increase)
(global-set-key (kbd "<f5>") 'goto-line)

