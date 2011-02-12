;; el-get
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "dv")
(add-to-list 'load-path "~/emacs.rc/el-get/")
(require 'el-get)
(setq el-get-recipe-path  '("~/emacs.rc/el-get/recipes/"))
(setq el-get-sources '(color-theme cmake-mode magit psvn
    ergoemacs-keybindings ahg auto-complete yasnippet))
(el-get 'sync)

(ergoemacs-mode 1)