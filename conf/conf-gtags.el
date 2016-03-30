;; gtags on Fedora
(setq load-path (cons "/usr/share/gtags" load-path))
(setq load-path (cons "/usr/local/share/gtags" load-path))
(setq load-path (cons "/usr/share/emacs/site-lisp" load-path))
(autoload 'gtags-mode "gtags" "" t)

(setq c-mode-hook '(lambda () (gtags-mode 1)))
(setq c++-mode-hook '(lambda () (gtags-mode 1)))
(setq c-mode-hook '(lambda () (global-linum-mode 1)))
(setq c++-mode-hook '(lambda () (global-linum-mode 1)))

(defun gtags-root-dir ()
    "Returns GTAGS root directory or nil if doesn't exist."
    (with-temp-buffer
      (if (zerop (call-process "global" nil t nil "-pr"))
          (buffer-substring (point-min) (1- (point-max)))
        nil)))
  (defun gtags-update ()
    "Make GTAGS incremental update"
    (call-process "global" nil nil nil "-u"))
  (defun gtags-update-hook ()
    (when (gtags-root-dir)
      (gtags-update)))

;; update gtags files after save
(add-hook 'after-save-hook 'gtags-update-hook)

