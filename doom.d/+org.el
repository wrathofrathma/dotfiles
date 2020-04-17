;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-
;;; Don't remove above. Makes it run slightly faster


;;; Org Mode configs
(setq org-directory "~/.sanctuary/org/"                      ; let's put files here
      org-use-property-inheritance t              ; it's convenient to have properties inherited
      org-log-done 'time                          ; having the time a item is done sounds convininet
      org-list-allow-alphabetical t               ; have a. A. a) A) list bullets
      ;; org-export-in-background t                  ; run export processes in external emacs process
      org-catch-invisible-edits 'smart)           ; try not to accidently do weird stuff in invisible regions


;;; Lord henrick's orders
;; Apply this to fix async export on the next branch merge of doom
;; (defadvice! +org--fix-async-export-a (orig-fn &rest args)
;;     :around #'org-export-to-file
;;     (if org-export-in-background
;;         (progn
;;           (setq org-export-async-init-file (make-temp-file "doom-org-async-export"))
;;           (with-temp-file org-export-async-init-file
;;             (prin1 `(progn (setq org-export-async-debug ,debug-on-error
;;                                  load-path ',load-path)
;;                            (load ,user-init-file nil t))
;;                    (current-buffer)))
;;           (apply orig-fn args))
;;       (apply orig-fn args)))


;; enabled org pretty tables everywhere
(setq global-org-pretty-table-mode t)

;; autocompeltion
(defun tec-org-python ()
  (if (eq major-mode 'python-mode)
   (progn (anaconda-mode t)
          (company-mode t)))
  )

(after! org (setq org-export-headline-levels 5)) ; I like nesting
(after! add-hook 'org-src-mode-hook 'tec-org-python)

(eval-after-load "org"
  '(require 'ox-gfm nil t))

;; no hard line wrapping
(add-hook! (gfm-mode markdown-mode) #'visual-line-mode #'turn-off-auto-fill)

(setq org-babel-python-command "python3")

;; Allows for creating arbitrary org buffers easily
(evil-define-command evil-buffer-org-new (count file)
  "Creates a new ORG buffer replacing the current window, optionally
   editing a certain FILE"
  :repeat nil
  (interactive "P<f>")
  (if file
      (evil-edit file)
    (let ((buffer (generate-new-buffer "*new org*")))
      (set-window-buffer nil buffer)
      (with-current-buffer buffer
        (org-mode)))))


(setq calc-angle-mode 'rad  ;; radians are rad
      calc-algebraic-mode t ;; allows '2*x instead of 'x<RET>2*
      calc-symbolic-mode t) ;; keeps stuff like √2 irrational for as long as possible
(after! calctex
  (setq calctex-format-latex-header (concat calctex-format-latex-header
                                            "\n\\usepackage{arevmath}")))
(add-hook 'calc-mode-hook #'calctex-mode)

(after! org
  (setq org-agenda-files (f-files org-directory
          (lambda (f)
            (string= (f-ext f) "org"))
          'recursive)
        )
)
