;;; catppuccin-theme.el --- Catppuccin theme -*- lexical-binding: t; no-byte-compile: t; -*-
(require 'doom-themes)

;;; Variables
(defgroup catppuccin-theme nil
  "Options for the `catppuccin-dark' theme."
  :group 'doom-themes)

(defcustom catppuccin-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'catppuccin-theme
  :type 'boolean)

(defcustom catppuccin-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'catppuccin-theme
  :type 'boolean)

(defcustom catppuccin-comment-bg catppuccin-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'catppuccin-theme
  :type 'boolean)

(defcustom catppuccin-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'catppuccin-theme
  :type '(or integer boolean))

;;; Theme definition
(def-doom-theme catppuccin
  "A community-driven pastel theme."

  ;; name        default   256         16
  (   ;; Day
   (flamingo   '("#F2CDCD"))
   (mauve      '("#DDB6F2"))
   (pink       '("#F5C2E7"))
   (maroon     '("#E8A2AF"))
   (red        '("#F28FAD"))
   (peach      '("#F8BD96"))
   (yellow     '("#FAE3B0"))
   (green      '("#ABE9B3"))
   (teal       '("#B5E8E0"))
   (blue       '("#96CDFB"))
   (sky        '("#89DCEB"))
   ;; Night
   (black0     '("#161320"))
   (black1     '("#1A1826"))
   (black2     '("#1E1E2E"))
   (black3     '("#302D41"))
   (black4     '("#575268"))
   (gray0      '("#6E6C7E"))
   (gray1      '("#988BA2"))
   (gray2      '("#C3BAC6"))
   (white      '("#D9E0EE"))
   (lavender   '("#C9CBFF"))
   (rosewater  '("#F5E0DC"))

   (bg         black1)
   (bg-alt     black3)
   (base0      black0)
   (base1      black1)
   (base2      black2)
   (base3      black3)
   (base4      black4)
   (base5      gray0)
   (base6      gray1)
   (base7      gray2)
   (base8      white)
   (fg         white)
   (fg-alt     lavender)

   (grey       base5)

   (magenta    '("#8041D8" "color-98"  "magenta"      ))
   (cyan       '("#36D8BD" "color-79"  "cyan"         ))

   (orange     '("#D85F00" "color-166"   "brightred"    ))
   (violet     '("#AB11D8" "color-128" "brightmagenta"))

   (bg-blue    '("#0C213E" "color-17"  "brightblack"  ))
   (dark-blue  bg-blue)
   (bg-cyan    '("#092D27" "color-23"   "brightblack"  ))
   (dark-cyan  bg-cyan)

   ;; face categories -- required for all themes
   (constants      peach)
   (functions      blue)
   (methods        blue)
   (keywords       pink)
   (strings        green)
   (numbers        peach)
   (operators      sky)
   (variables      flamingo)
   (type           blue)
   (comments       gray0)
   (doc-comments   teal)  ;; Docstrings
   (region         gray0) ;; Text selections
   (vertical-bar   black0) ;; Color of the window separators
   (builtin        peach) ;; Directives, such as those in vue.js html templating or lisp
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; face categories -- testing, but still required.
   (selection      sky)   ;; What the heck are selections
   (highlight      peach) ;; Also what are you?


   ;; custom categories
   (hidden bg)
   (-modeline-bright catppuccin-brighter-modeline)
   (-modeline-pad
    (when catppuccin-padded-modeline
      (if (integerp catppuccin-padded-modeline) catppuccin-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base7)

   (modeline-bg
    (if -modeline-bright
        (doom-blend blue bg 0.35)
      `(,(car base3) ,@(cdr base1))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-blend blue bg-alt 0.35)
      `(,(car base2) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(doom-darken (car bg-alt) 0.2) ,@(cdr base0)))
   (modeline-bg-inactive-l (doom-darken bg 0.20)))


  ;;;; Base theme face overrides
  ((font-lock-comment-face
    :slant 'italic
    :foreground comments
    :background (if catppuccin-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
   ((line-number &override) :foreground gray1)
   ((line-number-current-line &override) :foreground green :bold bold)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))

   ;;;; all-the-icons
   ((all-the-icons-dblue &override) :foreground teal)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground peach)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background base4 :foreground fg-alt)
   ;;;; flycheck
   (flycheck-popup-tip-face :background bg-alt :foreground fg-alt)
   (flycheck-posframe-info-face :background bg-alt :foreground fg-alt)
   (flycheck-posframe-warning-face :inherit 'warning)
   (flycheck-posframe-error-face :inherit 'error)
   ;;;; hl-fill-column-face
   (hl-fill-column-face :background bg-alt :foreground fg-alt)
   ;;;; ivy
   (ivy-current-match :background bg-alt :distant-foreground base0 :weight 'normal)
   (ivy-posframe :background base1 :foreground fg)
   (internal-border :background base7)
   ;;;; lsp-mode and lsp-ui-mode
   (lsp-ui-peek-highlight :foreground yellow)
   (lsp-ui-sideline-symbol-info :foreground (doom-blend comments bg 0.85)
                                :background bg-alt)
   ;;;; magit
   (magit-blame-culprit :foreground yellow)
   (magit-blame-header :foreground green)
   (magit-blame-sha1 :foreground yellow)
   (magit-blame-subject :foreground yellow)
   (magit-blame-time :foreground green)
   (magit-blame-name :foreground yellow)
   (magit-blame-heading :foreground green)
   (magit-blame-hash :foreground yellow)
   (magit-blame-summary :foreground yellow)
   (magit-blame-date :foreground green)
   (magit-log-date :foreground fg-alt)
   (magit-log-graph :foreground fg-alt)
   (magit-reflog-amend :foreground maroon)
   (magit-reflog-other :foreground sky)
   (magit-reflog-rebase :foreground maroon)
   (magit-reflog-remote :foreground sky)
   (magit-reflog-reset :foreground red)
   (magit-branch :foreground maroon :weight 'bold)
   (magit-branch-current :foreground blue :weight 'bold :box t)
   (magit-branch-local :foreground blue :weight 'bold)
   (magit-branch-remote :foreground peach :weight 'bold)
   (magit-diff-file-header :foreground yellow)
   (magit-diff-file-heading :foreground blue :weight 'light)
   (magit-diff-file-heading-highlight :foreground blue :weight 'bold)
   (magit-diff-file-heading-selection :foreground blue :weight 'bold :background base1)
   (magit-diff-hunk-heading :foreground yellow :weight 'light)
   (magit-diff-hunk-heading-highlight :foreground yellow :weight 'bold)
   (magit-diff-hunk-heading-selection :inherit 'selection :weight 'bold)
   (magit-diff-added :foreground green :weight 'light)
   (magit-diff-removed :foreground red :weight 'light)
   (magit-diff-context :foreground fg :weight 'light)
   (magit-diff-added-highlight :foreground green :weight 'bold)
   (magit-diff-removed-highlight :foreground red :weight 'bold)
   (magit-diff-context-highlight :foreground fg :weight 'bold)
   (magit-diff-base :foreground fg :weight 'light)
   (magit-diff-base-highlight :foreground fg :weight 'bold)
   (magit-diff-lines-boundary :background fg :foreground base2)
   (magit-diff-lines-heading :background fg :foreground base2)
   (magit-hash :foreground yellow)
   (magit-item-highlight :background grey)
   (magit-log-author :foreground yellow)
   (magit-log-head-label-head :background yellow :foreground bg-alt :weight 'bold)
   (magit-log-head-label-local :background red :foreground bg-alt :weight 'bold)
   (magit-log-head-label-remote :background green :foreground bg-alt :weight 'bold)
   (magit-log-head-label-tags :background maroon :foreground bg-alt :weight 'bold)
   (magit-log-head-label-wip :background sky :foreground bg-alt :weight 'bold)
   (magit-log-sha1 :foreground green)
   (magit-process-ng :foreground peach :weight 'bold)
   (magit-process-ok :foreground yellow :weight 'bold)
   (magit-section-heading :foreground red)
   (magit-section-highlight :weight 'bold)
   (section-heading-selection :foreground red :weight 'bold)
   (magit-section-title :background bg-alt :foreground red :weight 'bold)
   (magit-cherry-equivalent :foreground maroon)
   (magit-cherry-unmatched :foreground sky)
   (magit-reflog-checkout :foreground blue)
   (magit-reflog-cherry-pick :foreground green)
   (magit-bisect-bad :foreground red)
   (magit-bisect-good :foreground green)
   (magit-bisect-skip :foreground fg)
   (magit-diff-conflict-heading :foreground fg)
   (magit-dimmed :foreground base8)
   (magithub-ci-no-status :foreground grey)
   (magithub-issue-number :foreground fg)
   (magithub-notification-reason :foreground fg)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; org <built-in>
   ((org-block &override) :background bg-alt)
   ((org-block-begin-line &override) :background bg :foreground comments :slant 'italic)
   ((org-quote &override) :background base1)
   (org-hide :foreground hidden)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))
   ;;;; whitespace <built-in>
   (whitespace-indentation :inherit 'default)
   (whitespace-big-indent :inherit 'default))

  ;;;; Base theme variable overrides-
  ;; ()
  )

;;; catppuccin-theme.el ends here
