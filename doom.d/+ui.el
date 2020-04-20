;;; ~/.doom.d/ui.el -*- lexical-binding: t; -*-
;;; Don't remove above. Makes it run slightly faster

;; Lord henrick's orders
;; Testing out solaire mode for henrick
(after! solaire-mode
  (setq solaire-mode-remap-fringe nil)
  (add-to-list 'solaire-mode-remap-alist '((fringe solaire-fringe-face) . t))
  (defadvice! redraw-after-solaire-mode (&rest _)
    :after #'solaire-mode
    (if solaire-mode (force-mode-line-update)))

  (remove-hook 'focus-in-hook #'solaire-mode-reset)
  (remove-hook! '(doom-load-theme-hook doom-reload-hook) #'solaire-mode-reset)
  (remove-hook 'solaire-mode-hook #'+doom-disable-fringes-in-minibuffer-h)
  (advice-remove #'which-key--show-buffer-side-window #'+doom--no-fringes-in-which-key-buffer-a)
  (remove-hook! '(minibuffer-setup-hook window-configuration-change-hook) #'+doom-disable-fringes-in-minibuffer-h))

;; My visual settings changes.
;;; Common visual settings
;; Font
(setq doom-font (font-spec :family "hack" :size 16))
;; Theme settings
(setq doom-theme 'doom-outrun-electric)

;;;; Testing zone
;; TODO - Make this steal the theme colors and apply them in the same way theme-magic does. Then hook it into doom-load-theme-hook
(after! vterm
  (set-face-foreground 'vterm-color-black "#090819") ;; 0
  (set-face-foreground 'vterm-color-red "#e61f44") ;; 1
  (set-face-foreground 'vterm-color-green "#5e6a90") ;; 2
  (set-face-foreground 'vterm-color-yellow "#ffd400") ;; 3
  (set-face-foreground 'vterm-color-blue "#ff2afc") ;; 4
  (set-face-foreground 'vterm-color-magenta "#3b4167") ;; 5
  (set-face-foreground 'vterm-color-cyan "#42c6ff") ;; 6
  (set-face-foreground 'vterm-color-white "#f2f3f7") ;; 7

  (set-face-background 'vterm-color-black "#ff5798") ;; 8 ;; Needs work
  (set-face-background 'vterm-color-red "#e61f44") ;; 9
  (set-face-background 'vterm-color-green "#5e6a90") ;; 10
  (set-face-background 'vterm-color-yellow "#ffd400") ;; 11
  (set-face-background 'vterm-color-blue "#ff2afc") ;; 12
  (set-face-background 'vterm-color-magenta "#3b4167") ;; 13
  (set-face-background 'vterm-color-cyan "#42c6ff") ;; 14
  (set-face-background 'vterm-color-white "#f2f3f7") ;; 15
  )


;;; Toggle settings
(setq display-line-numbers-type 'relative)
(display-time-mode 1)                             ; Enable time in the mode-line
(display-battery-mode 1)                          ; On laptops it's nice to know how much power you have

;;; UI Changes
;; Nicer default buffer names
(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")

;; Adjusted the frame title to have the buffer name & project folder
(setq frame-title-format
    '(""
      "%b"
      (:eval
       (let ((project-name (projectile-project-name)))
         (unless (string= "-" project-name)
           (format (if (buffer-modified-p)  " ◉ %s" "  ●  %s") project-name))))))

;; Automatic update imenu for symbols
(use-package! imenu-list
  :config
  (setq imenu-list-idle-update-delay-time 0.5)
  (setq imenu-auto-rescan t)
  (define-key evil-normal-state-map (kbd "SPC t s") 'imenu-list-minor-mode)
  (set-popup-rule! "^\\*Ilist" :size 0.10 :side 'right :quit nil)
  )

(add-hook 'doom-load-theme-hook 'theme-magic-from-emacs)
(use-package! theme-magic
  :config
  (theme-magic-export-theme-mode)
  )

;; There's a bug with modeline in insert mode for orgdocs
;; (custom-set-faces! '(doom-modeline-evil-insert-state :weight bold :foreground "#339CDB"))

;;; Popup rules
;; Make lsp help docs & error checking popup quitable.
(set-popup-rule! "^\\*lsp-help" :size 0.15 :quit t)
(set-popup-rule! "^\\*Flycheck errors" :size 0.25 :quit t)


;; Splash image scripts I stole from https://github.com/tecosaur/emacs-config
(defvar fancy-splash-image-template
  (expand-file-name "misc/splash-images/blackhole-lines-template.svg" doom-private-dir)
  "Default template svg used for the splash image, with substitutions from ")
(defvar fancy-splash-image-nil
  (expand-file-name "misc/splash-images/transparent-pixel.png" doom-private-dir)
  "An image to use at minimum size, usually a transparent pixel")

(setq fancy-splash-sizes
  `((:height 500 :min-height 50 :padding (0 . 2) :template ,(expand-file-name "misc/splash-images/blackhole-lines-0.svg" doom-private-dir))
    (:height 440 :min-height 42 :padding (1 . 4) :template ,(expand-file-name "misc/splash-images/blackhole-lines-0.svg" doom-private-dir))
    (:height 400 :min-height 38 :padding (1 . 4) :template ,(expand-file-name "misc/splash-images/blackhole-lines-1.svg" doom-private-dir))
    (:height 350 :min-height 36 :padding (1 . 3) :template ,(expand-file-name "misc/splash-images/blackhole-lines-2.svg" doom-private-dir))
    (:height 300 :min-height 34 :padding (1 . 3) :template ,(expand-file-name "misc/splash-images/blackhole-lines-3.svg" doom-private-dir))
    (:height 250 :min-height 32 :padding (1 . 2) :template ,(expand-file-name "misc/splash-images/blackhole-lines-4.svg" doom-private-dir))
    (:height 200 :min-height 30 :padding (1 . 2) :template ,(expand-file-name "misc/splash-images/blackhole-lines-5.svg" doom-private-dir))
    (:height 100 :min-height 24 :padding (1 . 2) :template ,(expand-file-name "misc/splash-images/emacs-e-template.svg" doom-private-dir))
    (:height 0   :min-height 0  :padding (0 . 0) :file ,fancy-splash-image-nil)))

(defvar fancy-splash-sizes
  `((:height 500 :min-height 50 :padding (0 . 2))
    (:height 440 :min-height 42 :padding (1 . 4))
    (:height 330 :min-height 35 :padding (1 . 3))
    (:height 200 :min-height 30 :padding (1 . 2))
    (:height 0   :min-height 0  :padding (0 . 0) :file ,fancy-splash-image-nil))
  "list of plists with the following properties
  :height the height of the image
  :min-height minimum `frame-height' for image
  :padding `+doom-dashboard-banner-padding' to apply
  :template non-default template file
  :file file to use instead of template")

(defvar fancy-splash-template-colours
  '(("$colour1" . keywords) ("$colour2" . type) ("$colour3" . base5) ("$colour4" . base8))
  "list of colour-replacement alists of the form (\"$placeholder\" . 'theme-colour) which applied the template")

(unless (file-exists-p (expand-file-name "theme-splashes" doom-cache-dir))
  (make-directory (expand-file-name "theme-splashes" doom-cache-dir) t))

(defun fancy-splash-filename (theme-name height)
  (expand-file-name (concat (file-name-as-directory "theme-splashes")
                            (symbol-name doom-theme)
                            "-" (number-to-string height) ".svg")
                    doom-cache-dir))

(defun fancy-splash-clear-cache ()
  "Delete all cached fancy splash images"
  (interactive)
  (delete-directory (expand-file-name "theme-splashes" doom-cache-dir) t)
  (message "Cache cleared!"))

(defun fancy-splash-generate-image (template height)
  "Read TEMPLATE and create an image if HEIGHT with colour substitutions as  ;described by `fancy-splash-template-colours' for the current theme"
    (with-temp-buffer
      (insert-file-contents template)
      (re-search-forward "$height" nil t)
      (replace-match (number-to-string height) nil nil)
      (dolist (substitution fancy-splash-template-colours)
        (beginning-of-buffer)
        (while (re-search-forward (car substitution) nil t)
          (replace-match (doom-color (cdr substitution)) nil nil)))
      (write-region nil nil
                    (fancy-splash-filename (symbol-name doom-theme) height) nil nil)))

(defun fancy-splash-generate-images ()
  "Perform `fancy-splash-generate-image' in bulk"
  (dolist (size fancy-splash-sizes)
    (unless (plist-get size :file)
      (fancy-splash-generate-image (or (plist-get size :file)
                                       (plist-get size :template)
                                       fancy-splash-image-template)
                                   (plist-get size :height)))))

(defun ensure-theme-splash-images-exist (&optional height)
  (unless (file-exists-p (fancy-splash-filename
                          (symbol-name doom-theme)
                          (or height
                              (plist-get (car fancy-splash-sizes) :height))))
    (fancy-splash-generate-images)))

(defun get-appropriate-splash ()
  (let ((height (frame-height)))
    (cl-some (lambda (size) (when (>= height (plist-get size :min-height)) size))
             fancy-splash-sizes)))

(setq fancy-splash-last-size nil)
(setq fancy-splash-last-theme nil)
(defun set-appropriate-splash (&optional frame)
  (let ((appropriate-image (get-appropriate-splash)))
    (unless (and (equal appropriate-image fancy-splash-last-size)
                 (equal doom-theme fancy-splash-last-theme)))
    (unless (plist-get appropriate-image :file)
      (ensure-theme-splash-images-exist (plist-get appropriate-image :height)))
    (setq fancy-splash-image
          (or (plist-get appropriate-image :file)
              (fancy-splash-filename (symbol-name doom-theme) (plist-get appropriate-image :height))))
    (setq +doom-dashboard-banner-padding (plist-get appropriate-image :padding))
    (setq fancy-splash-last-size appropriate-image)
    (setq fancy-splash-last-theme doom-theme)
    (+doom-dashboard-reload)))

(add-hook 'window-size-change-functions #'set-appropriate-splash)
(add-hook 'doom-load-theme-hook #'set-appropriate-splash)
;; Rainbow delimiters everywhere!
(add-hook! 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook! 'text-mode-hook #'rainbow-delimiters-mode)
