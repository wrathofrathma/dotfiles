;;; radium-theme.el --- Radium theme -*- lexical-binding: t; no-byte-compile: t; -*-
(require 'doom-themes)

;;; Variables
(defgroup radium-theme nil
  "Options for the `radium-dark' theme."
  :group 'doom-themes)

(defcustom radium-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'radium-theme
  :type 'boolean)

(defcustom radium-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'radium-theme
  :type 'boolean)

(defcustom radium-comment-bg radium-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'radium-theme
  :type 'boolean)

(defcustom radium-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'radium-theme
  :type '(or integer boolean))

;;; Theme definition
(def-doom-theme radium
  "A community-driven pastel theme."

  ;; name        default   256         16
  (
   (white         '("#d4d4d5"))
   (darker_black  '("#0a0d11"))
   (black         '("#101317"))
   (black2        '("#171b20"))
   (one_bg        '("#1c1f23"))
   (one_bg2       '("#24272b"))
   (one_bg3       '("#2e3135"))
   (grey          '("#393c40"))
   (grey_fg       '("#404347"))
   (grey_fg2      '("#45484c"))
   (light_grey    '("#4b4e52"))
   (red           '("#f87070"))
   (baby_pink     '("#ff8e8e"))
   (pink          '("#ffa7a7"))
   (line          '("#292933")) ;; For vertical split / horizontal split lines
   (green         '("#37d99e"))
   (vibrant_green '("#79dcaa"))
   (blue          '("#7ab0df"))
   (nord_blue     '("#87bdec"))
   (yellow        '("#ffe59e"))
   (sun           '("#ffeda6"))
   (purple        '("#c397d8"))
   (dark_purple   '("#b68acb"))
   (teal          '("#63b3ad"))
   (orange        '("#f0a988"))
   (cyan          '("#50cad2"))
   (statusline_bg '("#15191e"))
   (lightbg       '("#24282d"))
   (lightbg2      '("#1d2126"))
   (pmenu_bg      '("#3bdda2"))
   (folder_bg     '("#5fb0fc"))

   ;; Base 16
   (base00      '("#101317"))
   (base01      '("#171C21"))
   (base02      '("#1c2026"))
   (base03      '("#20252b"))
   (base04      '("#3d464e"))
   (base05      '("#c5c5c6"))
   (base06      '("#cbcbcc"))
   (base07      '("#d4d4d5"))
   (base08      '("#37d99e"))
   (base09      '("#f0a988"))
   (base0A      '("#e5d487"))
   (base0B      '("#e87979"))
   (base0C      '("#37d99e"))
   (base0D      '("#5fb0fc"))
   (base0E      '("#c397d8"))
   (base0F      '("#e87979"))
   (bg '("#e87979"))
   (fg '("#e87979"))

   ;; face categories -- required for all themes
   ;; (booleans       base09)
   (constants      base08)
   (functions      base0D)
   (methods        base0D)
   (keywords       base0E)
   (strings        base0B)
   (numbers        base09)
   (operators      base05)
   (variables      base08) ;; TODO Check me
   (type           base0A)
   (comments       grey_fg)
   (doc-comments   grey_fg)  ;; Docstrings
   (region         grey_fg) ;; Text selections
   (vertical-bar   line) ;; Color of the window separators
   (builtin        base0A) ;; Directives, such as those in vue.js html templating or lisp

   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; face categories -- testing, but still required.
   (selection      teal)   ;; What the heck are selections
   (highlight      pink) ;; Also what are you?

   )
  )

;;; radium-theme.el ends here
