;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here, run 'doom sync' on
;; the command line, then restart Emacs for the changes to take effect.
;; Alternatively, use M-x doom/reload.


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a particular repo, you'll need to specify
;; a `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, for whatever reason,
;; you can do so here with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Real time update to imenu symbols browser
(package! imenu-list
  :recipe (:host github :repo "bmag/imenu-list"))

;; Itemized agenda
(package! org-super-agenda :pin "dd0d104c26")

;; delcarative org capture templates
(package! doct
  :recipe (:host github :repo "progfolio/doct")
  :pin "6cf1943ad7")

;; tabnine deep learning autocomplete
;; (package! company-tabnine ; tab9 autocomplete
;;   :recipe (:host github :repo "TommyX12/company-tabnine"
;;            :files ("company-tabnine.el" "fetch-binaries.sh")) :pin "e986a4ad0d")

(package! prettify-utils ; simplify messing with prettify-mode
  :recipe (:host github :repo "Ilazki/prettify-utils.el") :pin "8b783d316c")

;; Rotatable window management.
;; (package! rotate :pin "091b5ac4fc")

;; Check the weather
(package! wttrin :pin "df5427ce2a")

;; apply emacs theme to terminal
(package! theme-magic :pin "844c4311bd")
;; Fun:5 ends here

;; plugin for editing systemd unit files
(package! systemd :pin "51c148e09a")

;; Makes org tables prettier
(package! org-pretty-table-mode
  :recipe (:host github :repo "Fuco1/org-pretty-table") :pin "88380f865a")

;; Allows exporting using more markdown features, like the ones used by github.
(package! ox-gfm :pin "99f93011b0")

;; org mode web tools
(package! org-web-tools)

;(package! ob-session-async)

(package! org-ref)

;; (package! org-download)

(package! restclient)

(package! ob-restclient)

(package! vue-mode)

(package! nvm)
