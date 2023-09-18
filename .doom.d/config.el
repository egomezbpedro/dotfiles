;; -*- lexical-binding: t; -*-
;;$DOOMDIR/config.el
(setq user-full-name "Pedro Gomez"
      user-mail-address "pedroenrique.gomezb@gmail.com")

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "JetBrainsMonoNL Nerd Font" :size 16))

(setq doom-theme 'doom-one)
(setq +org-pretty-mode 1)

;;(doom/set-frame-opacity 95)
(add-to-list 'default-frame-alist '(alpha-background . 90))

(setq display-line-numbers-type 'relative)

(setq lsp-auto-guess-root t)

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

(global-prettify-symbols-mode 1)
(setq prettify-symbols-unprettify-at-point t)
(use-package org-pretty-tags
  :demand t
  :config
  (setq org-pretty-tags-surrogate-strings
        (quote
         (("TODO" . "  ")
        ("WAIT" . "  ")
        ("CANCELLED" . " 󰜺 ")
        ("DONE" . " ")
        ("[#A]" . " ")
        ("[#B]" . " ")
        ("[#C]" . " ")
        ("[ ]" . " ")
        ("[X]" . " ")
        ("[-]" . " ")
        ("#+BEGIN_SRC" . " ")
        ("#+END_SRC" . "―")
        (":PROPERTIES:" . " ")
        (":END:" . "―")
        ("#+STARTUP:" . " ")
        ("#+TITLE: " . "")
        ("#+RESULTS:" . " ")
        ("#+NAME:" . " ")
        ("#+ROAM_TAGS:" . " ")
        ("#+FILETAGS:" . " ")
        ("#+HTML_HEAD:" . " ")
        ("#+SUBTITLE:" . " ")
        ("#+AUTHOR:" . " ")
        (":Effort:" . " ")
        ("SCHEDULED:" . " ")
        ("DEADLINE:" . " ")))
          )
  (org-pretty-tags-global-mode))

(use-package org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚠" "⬆" "⬇" "🛏")))

;;(setq-default org-tex-prettify-list
;;      '(
;;        ("TODO" . "  ")
;;        ("WAIT" . "  ")
;;        ("CANCELLED" . " 󰜺 ")
;;        ("DONE" . " ")
;;        ("[#A]" . " ")
;;        ("[#B]" . " ")
;;        ("[#C]" . " ")
;;        ("[ ]" . " ")
;;        ("[X]" . " ")
;;        ("[-]" . " ")
;;        ("#+BEGIN_SRC" . " ")
;;        ("#+END_SRC" . "―")
;;        (":PROPERTIES:" . " ")
;;        (":END:" . "―")
;;        ("#+STARTUP:" . " ")
;;        ("#+TITLE: " . "")
;;        ("#+RESULTS:" . " ")
;;        ("#+NAME:" . " ")
;;        ("#+ROAM_TAGS:" . " ")
;;        ("#+FILETAGS:" . " ")
;;        ("#+HTML_HEAD:" . " ")
;;        ("#+SUBTITLE:" . " ")
;;        ("#+AUTHOR:" . " ")
;;        (":Effort:" . " ")
;;        ("SCHEDULED:" . " ")
;;        ("DEADLINE:" . " ")))
;;(add-hook 'org-hook-mode 'org-text-prettify-list)

(after! org
  (setq org-ellipsis " ↩ ")
  (setq org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆"))
  (setq org-superstar-itembullet-alist '((?+ . ?➤) (?- . ?✦))) ; changes +/- symbols in item lists
  )

(after! org
  (setq org-agenda-files '("~/org/agenda.org"
                           "~/org/notes.org"
                           "~/.doom.d/config.org"))
  (setq
   org-priority-faces
   '((?A :foreground "#ff6c6b" :weight bold)
     (?B :foreground "#98be65" :weight bold)
     (?C :foreground "#c678dd" :weight bold))
   )
  )

(after! org
  (setq
   org-log-done 'time
   org-todo-keywords           ; Overwrite the default TODO States
   '(
     (sequence
      "TODO(t)"            ; A task that is pending TO DO
      "|"                  ; Separete active and unactive tasks
      "DONE(d)"            ; A task that has been complete
      "CANCELLED(c)"       ; A task thast was cancelle
      ))

   ))
