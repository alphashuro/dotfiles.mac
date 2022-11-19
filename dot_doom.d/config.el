;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Alpha Shuro"
      user-mail-address "alphashuro@gmail.com")

;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings.

(setq doom-theme 'doom-ayu-dark)

;; If set to `nil', line numbers are disabled.
;; For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq org-directory "~/Dropbox/notes/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; https://github.com/prettier/prettier-emacs/issues/63
(exec-path-from-shell-initialize)

;; dired
(add-hook! dired-mode
  ;; Compress/Uncompress tar files
  ;; (auto-compression-mode t)

  ;; Auto refresh buffers
  (global-auto-revert-mode t)

  ;; Also auto refresh dired, but be quiet about it
  (setq global-auto-revert-non-file-buffers t)
  (setq auto-revert-verbose nil)

  ;; Emulate vinegar.vim
  (setq dired-omit-verbose nil)
  (setq dired-hide-details-hide-symlink-targets nil)
  (make-local-variable 'dired-hide-symlink-targets)
  (dired-hide-details-mode t))

(map!
 :n "-" #'dired-jump)

;; enable prettier globally on startup
(add-hook 'after-init-hook #'global-prettier-mode)

 (cl-loop for file in '("/opt/homebrew/bin/fish" "/bin/zsh")
	   when (file-exists-p file)
	   do (progn
		(setq shell-file-name file)
		(cl-return)))
  (setenv "SHELL" shell-file-name)

(add-hook 'code-review-mode-hook #'emojify-mode)
(setq code-review-fill-column 80)
(setq code-review-auth-login-marker 'forge)
(add-hook 'code-review-mode-hook
          (lambda ()
            ;; include *Code-Review* buffer into current workspace
            (persp-add-buffer (current-buffer))))
