;;; git-gutter-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (git-gutter:toggle git-gutter global-git-gutter-mode
;;;;;;  git-gutter-mode git-gutter:linum-setup) "git-gutter" "git-gutter.el"
;;;;;;  (22428 13465 113018 504000))
;;; Generated autoloads from git-gutter.el

(autoload 'git-gutter:linum-setup "git-gutter" "\
Setup for linum-mode.

\(fn)" nil nil)

(autoload 'git-gutter-mode "git-gutter" "\
Git-Gutter mode

\(fn &optional ARG)" t nil)

(defvar global-git-gutter-mode nil "\
Non-nil if Global-Git-Gutter mode is enabled.
See the command `global-git-gutter-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-git-gutter-mode'.")

(custom-autoload 'global-git-gutter-mode "git-gutter" nil)

(autoload 'global-git-gutter-mode "git-gutter" "\
Toggle Git-Gutter mode in all buffers.
With prefix ARG, enable Global-Git-Gutter mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Git-Gutter mode is enabled in all buffers where
`git-gutter--turn-on' would do it.
See `git-gutter-mode' for more information on Git-Gutter mode.

\(fn &optional ARG)" t nil)

(autoload 'git-gutter "git-gutter" "\
Show diff information in gutter

\(fn)" t nil)

(autoload 'git-gutter:toggle "git-gutter" "\
Toggle to show diff information.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("git-gutter-pkg.el") (22428 13465 129514
;;;;;;  176000))

;;;***

(provide 'git-gutter-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; git-gutter-autoloads.el ends here