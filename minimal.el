;; https://coderwall.com/p/klppdq/git-commits-from-emacs
;;
;; to include this in your `~/.gitconfig` add these lines:
;;
;; ```
;; [core]
;;    editor = emacs -nw --no-init-file --no-site-file --load ~/.emacs.minimal
;; ```
;;
;; taken from http://snarfed.org/minimal_emacs_for_fast_startup
; cutoff for word wrap
(setq-default fill-column 72)

; F12 toggles auto-fill mode
(global-set-key [f12] 'auto-fill-mode)

;;;;
;; included in example - want to evaluate before including

; C-- keybinding for undo (removes the shift)
;(global-set-key [(control -)] 'undo)

; turn on pending delete (when a region
; is selected, typing replaces it)
;(delete-selection-mode t)
;;;;

; when on a tab, make the cursor the tab length
(setq-default x-stretch-cursor t)

; avoid garbage collection (default is only 400k)
(setq-default gc-cons-threshold 4000000)

; turn on random customization options
(custom-set-variables
  '(sentence-end-double-space nil)
  '(truncate-partial-width-windows nil)
  '(line-number-mode t)
  '(column-number-mode t)
  '(query-user-mail-address nil)
  '(visible-bell t))
