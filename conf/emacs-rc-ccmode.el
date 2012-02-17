;;; emacs-rc-ccmode.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(require 'cc-mode)

;; customisation of cc-mode
(defun alexott/c-mode-common-hook ()
  ;; style customization
  (c-set-offset 'member-init-intro '++)
  (setq tab-width 4)
  (setq   indent-tabs-mode t)
  (c-set-offset 'substatement-open 0)
  (c-set-style "bsd")
  (setq c-basic-offset 4)
  (c-toggle-auto-hungry-state 0)
  ;; minor modes
  (auto-fill-mode 1)
  (gtags-mode 1)
  (hs-minor-mode 1)
  ;; local keys
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-common-hook)
(add-hook 'c-mode-common-hook 'alexott/common-hook)
(add-hook 'c-mode-common-hook 'alexott/common-prog-hook)

(defun fp-c-mode-routine ()
  (local-set-key "\M-q" 'rebox-comment))
(add-hook 'c-mode-hook 'fp-c-mode-routine)

(setq-default c-default-style (quote ((java-mode . "java") (other . "linux"))))

(add-to-list 'auto-mode-alist '("\\.ipp?$" . c++-mode))

;;; emacs-rc-cmode.el ends here