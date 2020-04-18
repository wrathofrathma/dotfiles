;;; ~/.doom.d/+binds.el -*- lexical-binding: t; -*-
;;; Don't remove above. Makes it run slightly faster


;; Changes normal mode s/S behavior from the evil-snipe to vanilla vim delete & insert
(after! evil-snipe
  (evil-snipe-mode -1))

(delete-selection-mode 1)                         ; Replace selection when inserting text

;; Makes which-key more responsive
(setq which-key-idle-delay 0.3)

(map! :leader
  (:prefix "b"
    :desc "New empty ORG buffer" "o" #'evil-buffer-org-new))
