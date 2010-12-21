;; el-get

(add-to-list 'load-path "~/emacs.rc/el-get/")
(require 'el-get)
(setq el-get-recipe-path  '("~/emacs.rc/el-get/recipes/"))
(setq el-get-sources '(magit psvn color-theme cmake-mode
                       cedet ergoemacs-keybindings 
                       ahg dvc ecb auto-complete
                       planner remember yasnippet))
(el-get 'sync)
