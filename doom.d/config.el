;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Rathma"
      user-mail-address "wrathofrathma@gmail.com")

;;; CUSTOM CONFIG FILES TO LOAD
(setq custom_files '("+org.el" "+ui.el" "+binds.el"))
(dolist (file custom_files)
  (setq fp (expand-file-name file doom-private-dir))
  (when (file-exists-p fp)
    (load! fp)))

;; Simple settings
(setq-default
 tab-width 2                                      ; Set width for tabs
 uniquify-buffer-name-style 'forward              ; Uniquify buffer names
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      inhibit-compacting-font-caches t)           ; When there are lots of glyphs, keep them in memory


;; Window behavior
(setq evil-vsplit-window-right t
      evil-split-window-below t)

;; (defun wm-hook ()
;; ;;   "Hooks for web mode."
;;   (setq web-mode-markup-indent-offset 2)
;;   (setq web-mode-code-indent-offset 2)
;;   (setq web-mode-css-indent-offset 2)
;;   (setq vue-html-tab-width 2)
;;   (set (make-local-variable 'tab-width) 2)
;;   (setq js-indent-level 2)
;;   (flycheck-mode t)
;;   (rainbow-mode)
;;   )
;; (add-hook 'web-mode-hook 'wm-hook)

(use-package! vue-mode
  :mode "\\.vue\\'"
  :hook (vue-mode . prettier-js-mode)
  :config
;;   (setq mmm-submode-decoration-level 0)
  (add-hook 'vue-mode-hook
            (lambda ()
              (set-face-background 'mmm-default-submode-face nil)))
  (add-hook 'vue-mode-hook #'lsp!)
  (setq js-indent-level 2))
  ;; (setq prettier-js-args '("--parser vue")))
;; (add-to-list 'auto-mode-alist '("\\.vue$" . vue-mode))
;; (use-package! lsp-mode
;;   :custom
;;   (lsp-vetur-format-default-formatter-css "none")
;;   (lsp-vetur-format-default-formatter-html "none")
;;   (lsp-vetur-format-default-formatter-js "none")
;;   (lsp-vetur-validation-template nil))

;; Update all pinned packages function
(defun +doom/update-all-pinned-package-form ()
  "Call `doom/update-pinned-package-form' on every package! statement in the buffer"
  (interactive)
  (beginning-of-buffer)
  (let ((progress 0) (total (how-many "package!")) (updated 0))
    (while (search-forward "package!" nil t)
      (setq progress (1+ progress))
      (forward-char) ;; move cursor to package name "package! |name"
      (message (format "Re-pinning package: %s/%s (%s)" progress total (current-word)))
      (backward-char)
      (evil-scroll-line-to-center (line-number-at-pos))
      (redisplay)
      (if (s-contains-p "Updated" (condition-case nil
                                      (doom/update-pinned-package-form)
                                    (user-error "")))
        (setq updated (1+ updated)))
      (search-forward "package!" nil t)) ;; because of cursor-moving done
    (message (format "%s packages updated" updated))))

;; Company autocomplete stuff
(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2)
  (setq company-show-numbers t)
(add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.

;; Improve the memory of company precident
(setq-default history-length 1000)
(setq-default prescient-history-length 1000)

;; Paired delimeters everywhere
;; (electric-pair-mode t)

;; Ispell dictionary stuff
;; (setq ispell-dictionary "en_US_SCOWL_80_0_k_hr")

;;wttrin default city set to autolocate based on ip
(setq wttrin-default-cities '(""))

;; (add-hook 'vue-mode-hook #'lsp!)
;; ;; VueJS setup by reddit user pbgc
;; ;; (flycheck-add-mode 'javascript-eslint 'vue-mode)
;; (defun vuejs-custom ()
;;   (setq vue-html-tab-width 2)
;;   (flycheck-mode t)
;;   (rainbow-mode)
;;   (global-set-key (kbd "C-c C-l") 'vue-mode-reparse)
;;   (global-set-key (kbd "C-c C-e") 'vue-mode-edit-indirect-at-point)
;;   (add-to-list 'write-file-functions 'delete-trailing-whitespace)
;;   (turn-on-diff-hl-mode))

;; (add-hook 'vue-mode-hook 'vuejs-custom)


;; (defun js-custom ()
;;   (flycheck-mode t)
;;   (company-mode)
;;   (set (make-local-variable 'tab-width) 2)
;;   (setq js-indent-level 2))

;; (add-hook 'js-mode-hook 'js-custom)

;; (setq lsp-prefer-flymake :none)

;; (setq lsp-ui-doc-enable nil)
;; (setq lsp-ui-imenu-enable t)
;; (setq lsp-ui-peek-enable t)
;; (setq lsp-ui-sideline-enable t)
;; ;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;; (define-key lsp-ui-mode-map (kbd "M--") #'lsp-ui-peek-find-references)

;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'mmm-mode-hook
          (lambda ()
            (set-face-background 'mmm-default-submode-face nil)))
