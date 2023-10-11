;; -*- lexical-binding: t; -*-
;;$DOOMDIR/config.el
(setq user-full-name "Pedro Gomez"
      user-mail-address "pedroenrique.gomezb@gmail.com")
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "JetBrainsMonoNL Nerd Font" :size 16))

(setq doom-theme 'doom-gruvbox)
(require 'pretty-mode)
(global-pretty-mode t)
(setq +org-pretty-mode 1)

(doom/set-frame-opacity 95)
(add-to-list 'default-frame-alist '(alpha-background . 40))

(setq display-line-numbers-type 'relative)

(setq lsp-auto-guess-root t)
(setq lsp-pyls-server-command "/home/gpedro/.local/bin/pylsp")

(map! :leader
      :desc "org-babel-tangle" "m B" #'org-babel-tangle)

(after! org
  (setq
   org-directory "~/org/"
   org-default-notes-file (expand-file-name "notes.org" org-directory)
   ))

(after! org
  (setq
   org-link-abbrev-alist
   '(
     ("google" . "https://google.com/search?q=")
     )))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(after! org
  (setq org-ellipsis " ↩ ")
  ;;(setq org-superstar-itembullet-alist '((?+ . ?➤) (?- . ?✦))) ; changes +/- symbols in item lists
  )

(setq prettify-symbols-mode 1)
(setq prettify-symbols-unprettify-at-point t)
(setq prettify-symbols-alist '(
                               ("#+begin_src" . "󰩀")
                               ("#+end_src" . "󰨿")
                               ("[ ]" . " ")
                               ("[X]" . " ")
                               ("[-]" . " ")))

(add-hook 'org-hook-mode 'prettify-symbols-alist)

(use-package org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '(" " "⬆" "⬇" "☕")))

(setq
 org-priority-faces
 '((?A :foreground "#ff6c6b" :weight bold)
   (?B :foreground "#98be65" :weight bold)
   (?C :foreground "#c678dd" :weight bold))
 )
(add-hook 'org-hook-mode 'org-fancy-priorities)

(after! org
  (setq org-agenda-files '("~/org/agenda.org"
                           "~/org/notes.org"
                           "~/.doom.d/config.org")))

(after! org
  (setq
   org-log-done 'time
   org-todo-keywords           ; Overwrite the default TODO States
   '(
     (sequence
      "TODO(t)"            ; A task that is pending TO DO
      "WAIT(p)"
      "STARTED(s)"
      "|"                  ; Separete active and unactive tasks
      "DONE(d)"            ; A task that has been complete
      "CANCELLED(c)"       ; A task thast was cancelle
      ))))
