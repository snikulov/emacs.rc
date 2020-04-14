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


;; set custom keybindings
(global-set-key [C-M-prior] 'text-scale-decrease)
(global-set-key [C-M-next] 'text-scale-increase)
(global-set-key [f5] 'goto-line)

(require 'popup-switcher)
(setq psw-in-window-center t)
(global-set-key [f2] 'psw-switch-buffer)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'clang-format)
(global-set-key [C-M-tab] 'clang-format-region)
