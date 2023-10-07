(in-package :lem)

(load-theme "chalk")

(lem-lisp-mode/internal::lisp-set-package "LEM")

;(set-language-environment "UTF-8")
;(setenv "LC_TYPE" "en_US.UTF-8")

(lem-paredit-mode:paredit-mode)

(add-hook *find-file-hook*
          (lambda (buffer)
            (when (eq (buffer-major-mode buffer) 'lem-lisp-mode:lisp-mode)
              (change-buffer-mode buffer 'lem-paredit-mode:paredit-mode t))
            (when (eq (buffer-temporary-p buffer) 'lem-lisp-mode:lisp-mode)
              (change-buffer-mode buffer 'lem-paredit-mode:paredit-mode t))))

(add-hook lem-lisp-mode:*lisp-repl-mode-hook* 'lem-paredit-mode:paredit-mode)

(lem/line-numbers:toggle-line-numbers)
