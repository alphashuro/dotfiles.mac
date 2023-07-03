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
(setq doom-font (font-spec :family "Hack Nerd Font" :size 12)
     doom-variable-pitch-font (font-spec :family "Hack Nerd Font" :size 14))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings.

(setq doom-theme 'doom-gruvbox)

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
;; (add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; https://github.com/prettier/prettier-emacs/issues/63
;; (exec-path-from-shell-initialize)

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
;; (add-hook 'after-init-hook #'global-prettier-mode)

 (cl-loop for file in '("/opt/homebrew/bin/fish" "/bin/zsh")
	   when (file-exists-p file)
	   do (progn
		(setq shell-file-name file)
		(cl-return)))
  (setenv "SHELL" shell-file-name)

;; (add-hook 'code-review-mode-hook #'emojify-mode)
;; (setq code-review-fill-column 80)
;; (setq code-review-auth-login-marker 'forge)
;; (add-hook 'code-review-mode-hook
;;           (lambda ()
;;             ;; include *Code-Review* buffer into current workspace
;;             (persp-add-buffer (current-buffer))))

;; use ctrl+h for backspace
(define-key key-translation-map [?\C-h] [?\C-?])

;; evil treesitter text objects
;; bind `function.outer`(entire function block) to `f` for use in things like `vaf`, `yaf`
;; (define-key evil-outer-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.outer"))
;; bind `function.inner`(function block without name and args) to `f` for use in things like `vif`, `yif`
;; (define-key evil-inner-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.inner"))

;; You can also bind multiple items and we will match the first one we can find
;; (define-key evil-outer-text-objects-map "a" (evil-textobj-tree-sitter-get-textobj ("conditional.outer" "loop.outer")))

;; (use-package! typescript-mode
;;   :after tree-sitter
;;   :config
;; ;;   ;; we choose this instead of tsx-mode so that eglot can automatically figure out language for server
;; ;;   ;; see https://github.com/joaotavora/eglot/issues/624 and https://github.com/joaotavora/eglot#handling-quirky-servers
;;    ;; (define-derived-mode typescriptreact-mode tsx-mode
;;    ;;   "TypeScript TSX")

;; ;;   ;; use our derived mode for tsx files
;;     (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescriptreact-mode))
;; ;;   ;; by default, typescript-mode is mapped to the treesitter typescript parser
;; ;;   ;; use our derived mode to map both .tsx AND .ts -> typescriptreact-mode -> treesitter tsx
;;     (add-to-list 'evil-textobj-tree-sitter-major-mode-language-alist '(typescriptreact-mode . "tsx"))
;; )

;; (after! tsx-mode
;; 	(add-to-list 'evil-textobj-tree-sitter-major-mode-language-alist '(tsx-mode . "tsx”)))

;; (add-hook 'typescript-mode-hook (lambda () (tree-sitter-mode 1)))

(map! :map dap-mode-map
      :leader
      :prefix ("d" . "dap")
      ;; basics
      :desc "dap next"          "n" #'dap-next
      :desc "dap step in"       "i" #'dap-step-in
      :desc "dap step out"      "o" #'dap-step-out
      :desc "dap continue"      "c" #'dap-continue
      :desc "dap hydra"         "h" #'dap-hydra
      :desc "dap debug restart" "r" #'dap-debug-restart
      :desc "dap debug"         "s" #'dap-debug

      ;; debug
      :prefix ("dd" . "Debug")
      :desc "dap debug recent"  "r" #'dap-debug-recent
      :desc "dap debug last"    "l" #'dap-debug-last

      ;; eval
      :prefix ("de" . "Eval")
      :desc "eval"                "e" #'dap-eval
      :desc "eval region"         "r" #'dap-eval-region
      :desc "eval thing at point" "s" #'dap-eval-thing-at-point
      :desc "add expression"      "a" #'dap-ui-expressions-add
      :desc "remove expression"   "d" #'dap-ui-expressions-remove

      :prefix ("db" . "Breakpoint")
      :desc "dap breakpoint toggle"      "b" #'realgud:toggle-source-breakpoint
      :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
      :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
      :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)

;; obsidian settings
(require 'obsidian)
(obsidian-specify-path "~/notes/alphashuro")
(setq obsidian-inbox-directory "+encounters")

(add-hook
 'obsidian-mode-hook
 (lambda ()
   (define-key evil-normal-state-map (kbd "RET") 'obsidian-follow-link-at-point)

   (local-set-key (kbd "C-i") 'obsidian-insert-link)

   ;; (local-set-key (kbd "") 'obsidian-backlink-jump)
   ))

(map! :map obsidian-mode-map
      [return] #'obsidian-follow-link-at-point

      :leader
      :prefix ("O" . "obsidian")

      :desc "backlink jump" "b" #'obsidian-backlink-jump
      :desc "follow link" "f" #'obsidian-follow-link-at-point
      :desc "insert link" "i" #'obsidian-insert-link
      :desc "jump" "j" #'obsidian-jump
      :desc "capture" "c" #'obsidian-capture
      )

;; (map! :leader
;;       (:prefix-map ("o" . "open"))
;;       :desc "eshell" "e" #'project-eshell
;;       )

;; (projectile-register-project-type 'obsidian '(".obsidian"))

;; (global-set-key (kbd "") 'obsidian-jump)
;; (global-set-key (kbd "YOUR_BINDING") 'obsidian-capture)

(global-obsidian-mode t)

(defun point-at-line (line)
    (goto-char (point-min))
    (forward-line (- line 1))
    (point)
)

(defun write-in-gutter (text line &optional color)
    (let* ((line-point (point-at-line line))
        (overlay (make-overlay line-point (+ line-point 1))))
    (overlay-put overlay 'line-prefix text)
    (overlay-put overlay 'face '(background-color . color))))

(defun read-cov-file (path)
  (interactive)
  (let
      ((cov-file (json-read-file path)))
    (mapcar 'read-cov-file-entry cov-file)))

(defun read-cov-file-entry (entry)
  (mapcar (coverage-for-line entry (file-path entry)) (statement-coverage entry)))

(defun file-path (entry)
  (cdr (nth 1 entry)))
(defun statement-coverage (entry)
  (cdr (nth 4 entry)))

(defun coverage-for-line (file-entry path)
  (lambda (statement-cov)
    (let
        ((statement-index (car statement-cov))
         (covs-table (make-hash-table :test 'equal)))
    (puthash
        path
        (list
            (read-line-start statement-index file-entry)
            (read-line-end statement-index file-entry)
            (cdr statement-cov))
        covs-table)
    covs-table)))

(defun read-line-start (statement-index file-entry)
  (cdr (nth 1 (nth 1 (assoc statement-index (cdr (nth 3 file-entry)))))))

(defun read-line-end (statement-index file-entry)
  (cdr (nth 1 (nth 2 (assoc statement-index (cdr (nth 3 file-entry)))))))

(define-minor-mode cov-mode
    "Show line coverage from tests"

    :lighter nil

    (let* ((checkmark "\u2713")
        (cross "\u2717")
        (circle "\u25CB")
        (cov-report "./coverage/coverage-final.json")
        (cov-data (json-read-file cov-report)))



        (write-in-gutter checkmark 1 "green")
        (write-in-gutter cross 2 "red")
        (write-in-gutter circle 3 "white")))

(setq envrc-direnv-executable "/opt/homebrew/bin/direnv")
(setq projectile-project-search-path "~/alpha/projects")
