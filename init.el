;;  DO NOT EDIT THIS FILE DIRECTLY
;;  This is a file generated from a literate programing source file located at
;;  https://github.com/zzamboni/vcsh_emacs/blob/master/.emacs.d/init.org.
;;  You should make any changes there and regenerate it from Emacs org-mode using C-c C-v t

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq package-archives '(("gnu"       . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("org"       . "http://orgmode.org/elpa/")
                         ))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(use-package use-package
  :config
  (setq use-package-always-ensure t)) ; Always install missing packages

(defun set-proxy ()
  (interactive)
  (setq url-proxy-services '(("http" . "proxy.corproot.net:8079")
                             ("https" . "proxy.corproot.net:8079"))))
(defun unset-proxy ()
  (interactive)
  (setq url-proxy-services nil))

(add-hook 'before-save-hook 'time-stamp)

(setq kill-whole-line t)

(setq mouse-yank-at-point t)

(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(global-linum-mode)

;; Highlight trailing whitespace
(setq show-trailing-whitespace t)

(show-paren-mode 1)

(setq-default indent-tabs-mode nil)

(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

(when (fboundp 'winner-mode) (winner-mode 1))

(use-package unfill)

(use-package saveplace
  :config
  (setq-default save-place t)
  (setq save-place-file (concat user-emacs-directory "places")))

(use-package imenu-anywhere
  :config
  (global-set-key (kbd "M-i") 'ido-imenu-anywhere))

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1))

(global-set-key [(meta g)] 'goto-line)

(global-set-key [(meta \`)] 'other-frame)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "M-/") 'hippie-expand)

(defun goto-match-paren (arg)
  "Go to the matching paren/bracket, otherwise (or if ARG is not nil) insert %.
  vi style of % jumping to matching brace."
  (interactive "p")
  (if (not (memq last-command '(set-mark
                                cua-set-mark
                                goto-match-paren
                                down-list
                                up-list
                                end-of-defun
                                beginning-of-defun
                                backward-sexp
                                forward-sexp
                                backward-up-list
                                forward-paragraph
                                backward-paragraph
                                end-of-buffer
                                beginning-of-buffer
                                backward-word
                                forward-word
                                mwheel-scroll
                                backward-word
                                forward-word
                                mouse-start-secondary
                                mouse-yank-secondary
                                mouse-secondary-save-then-kill
                                move-end-of-line
                                move-beginning-of-line
                                backward-char
                                forward-char
                                scroll-up
                                scroll-down
                                scroll-left
                                scroll-right
                                mouse-set-point
                                next-buffer
                                previous-buffer
                                previous-line
                                next-line
                                )))
      (self-insert-command (or arg 1))
    (cond ((looking-at "\\s\(") (sp-forward-sexp) (backward-char 1))
          ((looking-at "\\s\)") (forward-char 1) (sp-backward-sexp))
          (t (self-insert-command (or arg 1))))))

(global-set-key (kbd "%") 'goto-match-paren)

(cond ((eq system-type 'darwin)
       (setq mac-command-modifier 'meta)
       (setq mac-option-modifier 'alt)
       (setq mac-right-option-modifier 'super)
       (global-set-key (kbd "M-+") 'text-scale-increase)
       (global-set-key (kbd "M-=") 'text-scale-increase)
       (global-set-key (kbd "M--") 'text-scale-decrease)
       (defun text-scale-reset ()
         (interactive)
         (text-scale-set 0))
       (global-set-key (kbd "M-0") 'text-scale-reset)
       (use-package exec-path-from-shell
         :config
         (exec-path-from-shell-initialize))
       )
      ((eq system-type 'windows-nt)
       
       )
      ((eq system-type 'gnu/linux)
       
       ))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package diminish)

;;(use-package solarized-theme)
;;(use-package darktooth-theme)
;;(use-package kaolin-themes)
(use-package gruvbox-theme)
(load-theme 'gruvbox)

(use-package desktop
  :config
  (desktop-save-mode 1))

(use-package uniquify
  :ensure nil
  :config
  (setq uniquify-after-kill-buffer-p t)
  (setq uniquify-buffer-name-style 'post-forward)
  (setq uniquify-strip-common-suffix nil))

(global-hl-line-mode 1)
(use-package col-highlight
  :config
  (col-highlight-toggle-when-idle)
  (col-highlight-set-interval 2))
;; (use-package crosshairs
;;   :config
;;   (crosshairs-mode))

(use-package ido
  :config
  (ido-mode t)
  (ido-everywhere 1)
  (setq ido-use-virtual-buffers t)
  (setq ido-enable-flex-matching t)
  (setq ido-use-filename-at-point nil)
  (setq ido-auto-merge-work-directories-length -1))

(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode 1))

(use-package recentf
  :init
  (defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
    (interactive)
    (if (find-file (ido-completing-read "Find recent file: " recentf-list))
        (message "Opening file...")
      (message "Aborting")))
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-items 50)
  (global-set-key (kbd "C-x C-r") 'ido-recentf-open))

(use-package ibuffer
  :config
  (global-set-key (kbd "C-x C-b") 'ibuffer))

(use-package smex
  :bind (("M-x" . smex))
  :config (smex-initialize))

(use-package midnight
  :config
  (setq midnight-mode 't)
  (setq midnight-period 7200))

(use-package writeroom-mode)

(use-package neotree
  :config
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))
  (global-set-key [f8] 'neotree-project-dir))

(use-package wc-mode)

(use-package subword
  :config
  (add-hook 'clojure-mode-hook #'subword-mode))

(use-package aggressive-indent
  :diminish aggressive-indent-mode
  :config
  (add-hook 'prog-mode-hook #'aggressive-indent-mode))

(use-package company
  :diminish company-mode
  :config
  (add-hook 'after-init-hook #'global-company-mode))

(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-global-mode))

(use-package iedit
  :config (set-face-background 'iedit-occurrence "Magenta"))

(use-package eldoc
  :config
  (add-hook 'prog-mode-hook #'turn-on-eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'turn-on-eldoc-mode))

(use-package flyspell
  :config
  (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
  (define-key flyspell-mouse-map [mouse-3] #'undefined)
  (add-hook 'text-mode-hook   'flyspell-mode))

(use-package clojure-mode
  :mode "\\.clj.*$"
  :mode "riemann.config"
  :mode "\\.boot"
  :config
  (add-to-list 'magic-mode-alist '(".* boot" . clojure-mode)))

(use-package clojure-mode-extra-font-locking)

(use-package cider
  :config
  ;; nice pretty printing
  (setq cider-repl-use-pretty-printing nil)

  ;; nicer font lock in REPL
  (setq cider-repl-use-clojure-font-lock t)

  ;; result prefix for the REPL
  (setq cider-repl-result-prefix "; => ")

  ;; never ending REPL history
  (setq cider-repl-wrap-history t)

  ;; looong history
  (setq cider-repl-history-size 5000)

  ;; persistent history
  (setq cider-repl-history-file "~/.emacs.d/cider-history")

  ;; error buffer not popping up
  (setq cider-show-error-buffer nil)

  ;; go right to the REPL buffer when it's finished connecting
  (setq cider-repl-pop-to-buffer-on-connect t))

(use-package clj-refactor
  :config
  (defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))
  (add-hook 'clojure-mode-hook #'my-clojure-mode-hook))

(use-package helm)
(use-package clojure-cheatsheet
  :config
  (eval-after-load 'clojure-mode
    '(progn
       (define-key clojure-mode-map (kbd "C-c C-h") #'clojure-cheatsheet))))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode))

(use-package smartparens
  :diminish smartparens-mode
  :config
  (require 'smartparens-config)
  (setq sp-base-key-bindings 'paredit)
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
  (add-hook 'lisp-mode-hook #'smartparens-strict-mode)
  (add-hook 'cider-repl-mode-hook #'smartparens-strict-mode))

(defun sp-enclose-next-sexp (num) (interactive "p") (insert-parentheses (or num 1)))
(add-hook 'smartparens-mode-hook #'sp-use-paredit-bindings)
(add-hook 'smartparens-mode-hook (lambda () (local-set-key (kbd "M-(") 'sp-enclose-next-sexp)))

(use-package hl-sexp
  :config
  (add-hook 'clojure-mode-hook #'hl-sexp-mode)
  (add-hook 'lisp-mode-hook #'hl-sexp-mode)
  (add-hook 'emacs-lisp-mode-hook #'hl-sexp-mode))

(use-package cfengine
  :commands cfengine3-mode
  :mode ("\\.cf\\'" . cfengine3-mode))

;; CPerl mode - doesn't auto-set the mode for some reason
(use-package cperl-mode
  :mode "\\.p[lm]\\'"
  :interpreter "perl"
  :config
  (setq cperl-hairy t))

;; mode for editing fish shell scripts
(use-package fish-mode
  :mode "\\.fish\\'"
  :interpreter "fish")

(use-package lua-mode)

(use-package yaml-mode)

(use-package applescript-mode)

(use-package go-mode)

(use-package package-lint)

(use-package elvish-mode)

(use-package racket-mode)

(use-package nix-mode)

(use-package magit
  :config
  (defadvice magit-status (around magit-fullscreen activate)
    "Make magit-status run alone in a frame."
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))

  (defun magit-quit-session ()
    "Restore the previous window configuration and kill the magit buffer."
    (interactive)
    (kill-buffer)
    (jump-to-register :magit-fullscreen))

  (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
  (global-set-key (kbd "C-c C-g") 'magit-status))

(use-package ag)

(use-package easy-hugo
  :config
  (setq easy-hugo-basedir "~/Personal/devel/zzamboni.org/zzamboni.org/")
  (setq easy-hugo-url "http://zzamboni.org/")
  (setq easy-hugo-previewtime "300")
  (define-key global-map (kbd "C-c C-e") 'easy-hugo))

(defun my-randomize-region (beg end)
  "Randomize lines in region from BEG to END."
  (interactive "*r")
  (let ((lines (split-string
                (delete-and-extract-region beg end) "\n")))
    (when (string-equal "" (car (last lines 1)))
      (setq lines (butlast lines 1)))
    (apply 'insert
           (mapcar 'cdr
                   (sort (mapcar (lambda (x) (cons (random) (concat x "\n"))) lines)
                         (lambda (a b) (< (car a) (car b))))))))

(use-package adoc-mode
  :mode "\\.asciidoc\\'")

(use-package markdown-mode)

(use-package typopunct
  :config
  (typopunct-change-language 'english t))

(use-package org
  :config
  (when (not (package-installed-p 'org-plus-contrib))
    (package-install 'org-plus-contrib))

  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)
  ;; Keep the indentation well structured by. OMG this is a must have. Makes
  ;; it feel less like editing a big text file and more like a purpose built
  ;; editor for org mode that forces the indentation.
  (setq org-startup-indented t)

  ;; Org-reveal mode: https://github.com/yjwen/org-reveal
  (setq org-reveal-root "file:///Users/taazadi1/Dropbox/org/reveal.js")
  (use-package ox-reveal)
  (use-package htmlize) ;; For reveal-mode

  ;; Export to Markdown
  (require 'ox-md)

  ;; Export to Jira markup https://github.com/stig/ox-jira.el
  (use-package ox-jira)

  ;; Export to Confluence markup
  (require 'ox-confluence)

  ;; Export to AsciiDoc
  (use-package ox-asciidoc)

  ;; Keep a Journal
  (use-package org-journal
    :config
    (setq org-journal-dir "~/Documents/logbook"))

  ;; Org-babel mode stuff
  (use-package ob-cfengine3)
  (require 'ob-ruby)
  (require 'ob-latex)
  (require 'ob-plantuml)
  (setq org-plantuml-jar-path
        (expand-file-name "/usr/local/Cellar/plantuml/1.2017.18/libexec/plantuml.jar"))
  (require 'ob-python)
  (require 'ob-shell)
  (require 'ob-calc)
  (use-package inf-ruby)
  (setq org-confirm-babel-evaluate nil)
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
  (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
  ;; Automatically tangle files on save, only in org-mode
  (add-hook 'org-mode-hook
            (lambda () (add-hook 'after-save-hook 'org-babel-tangle
                                 'run-at-end 'only-in-org-mode)))

  (use-package org-jira
    :config
    ;; (setq jiralib-url "https://tracker.mender.io:443")
    (setq jiralib-url "https://jira.swisscom.com")
    (setq org-jira-working-dir "~/.org-jira"))

  ;; Beautify org-mode, from http://www.howardism.org/Technical/Emacs/orgmode-wordprocessor.html
  ;; Commented out until I get a better handle of org-mode first
  (setq org-hide-emphasis-markers t)
  (font-lock-add-keywords 'org-mode
                          '(("^ +\\([-*]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (use-package org-bullets
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
  (let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                               ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                               ((x-list-fonts "Verdana")         '(:font "Verdana"))
                               ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                               (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces 'user
                            `(org-level-8 ((t (,@headline ,@variable-tuple))))
                            `(org-level-7 ((t (,@headline ,@variable-tuple))))
                            `(org-level-6 ((t (,@headline ,@variable-tuple))))
                            `(org-level-5 ((t (,@headline ,@variable-tuple))))
                            `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
                            `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
                            `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
                            `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
                            `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))
  )
