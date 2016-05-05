;;; darkokai-theme.el --- A darker variant on Monokai.

;; URL: http://github.com/sjrmanning/darkokai
;; Version: 0.1.0

;;; Commentary:
;;
;; This theme and particular the structure of this file is entirely based
;; on the great work by `oneKelvinSmith' and his port of the monokai theme
;; found at https://github.com/oneKelvinSmith/monokai-emacs.
;;
;; Darkokai arose after I found myself making more and more small tweaks
;; to monokai via a separate theme overrides file. Eventually it made more
;; sense to create a new theme as it was diverging significantly from the
;; original theme.
;;
;; Pull requests, and suggestions are most welcome!
;;
;;; Code:

(unless (>= emacs-major-version 24)
  (error "The darkokai theme requires Emacs 24 or later!"))

(deftheme darkokai "The Darkokai colour theme")

(defgroup darkokai nil
  "Darkokai theme options.
The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom darkokai-distinct-fringe-background t
  "Make the fringe background different from the normal background color.
Also affects 'linum-mode' background."
  :type 'boolean
  :group 'darkokai)

(defcustom darkokai-use-variable-pitch t
  "Use variable pitch face for some headings and titles."
  :type 'boolean
  :group 'darkokai)

(defcustom darkokai-high-contrast-mode-line nil
  "Make the active/inactive mode line stand out more."
  :type 'boolean
  :group 'darkokai)

(defcustom darkokai-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'darkokai)

(defcustom darkokai-height-plus-1 1.1
  "Font size +1."
  :type 'number
  :group 'darkokai)

(defcustom darkokai-height-plus-2 1.15
  "Font size +2."
  :type 'number
  :group 'darkokai)

(defcustom darkokai-height-plus-3 1.2
  "Font size +3."
  :type 'number
  :group 'darkokai)

(defcustom darkokai-height-plus-4 1.3
  "Font size +4."
  :type 'number
  :group 'darkokai)

(let* ((class                    '((class color) (min-colors 257)))
       ;; Primary colors
       (darkokai-yellow           "#E6DB74")
       (darkokai-orange           "#ffac4a")
       ;; (darkokai-orange           "#FD971F")
       (darkokai-red              "#ff0066")
       (darkokai-magenta          "#ff8eff")
       (darkokai-violet           "#ab7eff")
       (darkokai-blue             "#06d8ff")
       (darkokai-cyan             "#53f2dc")
       (darkokai-green            "#63de5d")
       (darkokai-gray             "#35393b")
       ;; Darker and lighter accented colors
       (darkokai-yellow-d         "#BEB244")
       (darkokai-yellow-l         "#FFF7A8")
       (darkokai-orange-d         "#de8f2d")
       (darkokai-orange-l         "#ffc260")
       (darkokai-red-d            "#F70057")
       (darkokai-red-l            "#FE61A0")
       (darkokai-magenta-d        "#FF61FF")
       (darkokai-magenta-l        "#FFC4FF")
       (darkokai-violet-d         "#9257FF")
       (darkokai-violet-l         "#C9ACFF")
       (darkokai-blue-d           "#40CAE4")
       (darkokai-blue-l           "#92E7F7")
       (darkokai-cyan-d           "#00b2ac")
       (darkokai-cyan-l           "#BBF7EF")
       (darkokai-green-d          "#86C30D")
       (darkokai-green-l          "#BBEF53")
       (darkokai-gray-ld          "#383c3d")
       (darkokai-gray-d           "#35393b")
       (darkokai-gray-dd          "#2B2F31")
       (darkokai-gray-l           "#7B7962")
       (darkokai-green-plain      "#2AD043")
       (darkokai-red-plain        "#FF6159")
       ;; Adaptive colors
       (darkokai-fg               "#f8fbfc")
       (darkokai-bg               "#242728")
       (darkokai-highlight-line   "#424748")
       (darkokai-highlight        "#5D6365")
       (darkokai-emph             "#ffffff")
       (darkokai-comments         "#6A6D70")
       ;; Adaptive higher/lower contrast accented colors
       (darkokai-fg-hc            "#141414")
       (darkokai-fg-lc            "#171A0B")
       ;; High contrast colors
       (darkokai-yellow-hc        "#FFFACE")
       (darkokai-yellow-lc        "#9A8F21")
       (darkokai-orange-hc        "#FFBE74")
       (darkokai-orange-lc        "#A75B00")
       (darkokai-red-hc           "#FEB0CC")
       (darkokai-red-lc           "#F20055")
       (darkokai-magenta-hc       "#FEC6F9")
       (darkokai-magenta-lc       "#F309DF")
       (darkokai-violet-hc        "#F0E7FF")
       (darkokai-violet-lc        "#7830FC")
       (darkokai-blue-hc          "#CAF5FD")
       (darkokai-blue-lc          "#1DB4D0")
       (darkokai-cyan-hc          "#D3FBF6")
       (darkokai-cyan-lc          "#4BBEAE")
       (darkokai-green-hc         "#CCF47C")
       (darkokai-green-lc         "#63de5d")
       ;; customize based face properties
       (s-variable-pitch         (if darkokai-use-variable-pitch
                                     'variable-pitch 'default))
       (s-fringe-bg              (if darkokai-distinct-fringe-background
                                     darkokai-gray-dd darkokai-bg))
       (s-mode-line-fg           (if darkokai-high-contrast-mode-line
                                     darkokai-bg darkokai-fg))
       (s-mode-line-bg           (if darkokai-high-contrast-mode-line
                                     darkokai-fg darkokai-gray))
       (s-mode-line-buffer-id-fg (if darkokai-high-contrast-mode-line
                                     'unspecified darkokai-green-lc))
       (s-mode-line-inactive-fg  (if darkokai-high-contrast-mode-line
                                     darkokai-fg darkokai-comments))
       (s-mode-line-inactive-bg  (if darkokai-high-contrast-mode-line
                                     darkokai-gray-dd darkokai-bg))
       (s-mode-line-inactive-bc  (if darkokai-high-contrast-mode-line
                                     darkokai-fg darkokai-gray))

       ;; powerline
       (s-powerline-active1-bg   (if darkokai-high-contrast-mode-line
                                     darkokai-gray-l darkokai-gray))
       (s-powerline-active2-bg   (if darkokai-high-contrast-mode-line
                                     darkokai-gray darkokai-gray-l))
       (s-powerline-inactive1-bg (if darkokai-high-contrast-mode-line
                                     darkokai-gray darkokai-gray-d))
       (s-powerline-inactive2-bg (if darkokai-high-contrast-mode-line
                                     darkokai-bg darkokai-gray))

       ;; Definitions for terminals that do not support 256 colors
       (terminal-class                    '((class color) (min-colors 89)))
       ;; Primary colors
       (terminal-darkokai-yellow           "#CDC673")
       (terminal-darkokai-orange           "#FF8C00")
       (terminal-darkokai-red              "#FF1493")
       (terminal-darkokai-magenta          "#D700D7")
       (terminal-darkokai-violet           "#AF87FF")
       (terminal-darkokai-blue             "#5FD7FF")
       (terminal-darkokai-cyan             "#5FFFFF")
       (terminal-darkokai-green            "#87D700")
       (terminal-darkokai-gray             "#3D3D3D")
       ;; Darker and lighter accented colors
       (terminal-darkokai-yellow-d         "#878700")
       (terminal-darkokai-yellow-l         "#FFFF87")
       (terminal-darkokai-orange-d         "#AF5F00")
       (terminal-darkokai-orange-l         "#FFAF5F")
       (terminal-darkokai-red-d            "#870000")
       (terminal-darkokai-red-l            "#FF5F87")
       (terminal-darkokai-magenta-d        "#AF0087")
       (terminal-darkokai-magenta-l        "#FF87DF")
       (terminal-darkokai-violet-d         "#5F00AF")
       (terminal-darkokai-violet-l         "#AF87D7")
       (terminal-darkokai-blue-d           "#008787")
       (terminal-darkokai-blue-l           "#87D7FF")
       (terminal-darkokai-cyan-d           "#5FAFAF")
       (terminal-darkokai-cyan-l           "#AFFFFF")
       (terminal-darkokai-green-d          "#5F8700")
       (terminal-darkokai-green-l          "#AFD700")
       (terminal-darkokai-gray-d           "#333333")
       (terminal-darkokai-gray-l           "#707070")
       ;; Adaptive colors
       (terminal-darkokai-fg               "#F5F5F5")
       (terminal-darkokai-bg               "#1B1E1C")
       (terminal-darkokai-highlight-line   "#474747")
       (terminal-darkokai-highlight        "#F4A460")
       (terminal-darkokai-emph             "#FFFAFA")
       (terminal-darkokai-comments         "#8B8878")
       ;; Adaptive higher/lower contrast accented colors
       (terminal-darkokai-fg-hc            "#171A0B")
       (terminal-darkokai-fg-lc            "#141414")
       ;; High contrast colors
       (terminal-darkokai-yellow-hc        terminal-darkokai-yellow-d)
       (terminal-darkokai-yellow-lc        terminal-darkokai-yellow-l)
       (terminal-darkokai-orange-hc        terminal-darkokai-orange-d)
       (terminal-darkokai-orange-lc        terminal-darkokai-orange-l)
       (terminal-darkokai-red-hc           terminal-darkokai-red-d)
       (terminal-darkokai-red-lc           terminal-darkokai-red-l)
       (terminal-darkokai-magenta-hc       terminal-darkokai-magenta-d)
       (terminal-darkokai-magenta-lc       terminal-darkokai-magenta-l)
       (terminal-darkokai-violet-hc        terminal-darkokai-violet-d)
       (terminal-darkokai-violet-lc        terminal-darkokai-violet-l)
       (terminal-darkokai-blue-hc          terminal-darkokai-blue-d)
       (terminal-darkokai-blue-lc          terminal-darkokai-blue-l)
       (terminal-darkokai-cyan-hc          terminal-darkokai-cyan-d)
       (terminal-darkokai-cyan-lc          terminal-darkokai-cyan-l)
       (terminal-darkokai-green-hc         terminal-darkokai-green-d)
       (terminal-darkokai-green-lc         terminal-darkokai-green-l)
       ;; customize based face properties
       (terminal-s-variable-pitch         (if darkokai-use-variable-pitch
                                              'variable-pitch 'default))
       (terminal-s-fringe-bg              (if darkokai-distinct-fringe-background
                                              terminal-darkokai-gray terminal-darkokai-bg))
       (terminal-s-mode-line-fg           (if darkokai-high-contrast-mode-line
                                              terminal-darkokai-bg terminal-darkokai-fg))
       (terminal-s-mode-line-bg           (if darkokai-high-contrast-mode-line
                                              terminal-darkokai-fg terminal-darkokai-gray))
       (terminal-s-mode-line-buffer-id-fg (if darkokai-high-contrast-mode-line
                                              'unspecified terminal-darkokai-green))
       (terminal-s-mode-line-inactive-fg  (if darkokai-high-contrast-mode-line
                                              terminal-darkokai-fg terminal-darkokai-comments))
       (terminal-s-mode-line-inactive-bg  (if darkokai-high-contrast-mode-line
                                              terminal-darkokai-highlight-line terminal-darkokai-bg))
       (terminal-s-mode-line-inactive-bc  (if darkokai-high-contrast-mode-line
                                              terminal-darkokai-fg terminal-darkokai-gray)))

  ;; Define faces
  (custom-theme-set-faces
   'darkokai

   ;; font lock for syntax highlighting
   `(font-lock-builtin-face
     ((,class (:foreground ,darkokai-red
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :weight normal))))

   `(font-lock-comment-delimiter-face
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(font-lock-comment-face
     ((,class (:foreground ,darkokai-comments
                           :background nil))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(font-lock-constant-face
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   `(font-lock-doc-face
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(font-lock-function-name-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(font-lock-keyword-face
     ((,class (:foreground ,darkokai-red
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :weight normal))))

   `(font-lock-negation-char-face
     ((,class (:foreground ,darkokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight bold))))

   `(font-lock-preprocessor-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(font-lock-regexp-grouping-construct
     ((,class (:foreground ,darkokai-yellow
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight normal))))

   `(font-lock-regexp-grouping-backslash
     ((,class (:foreground ,darkokai-violet
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-violet
                                    :weight normal))))

   `(font-lock-string-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(font-lock-type-face
     ((,class (:foreground ,darkokai-blue
                           :italic nil))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :italic nil))))

   `(font-lock-variable-name-face
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(font-lock-warning-face
     ((,class (:foreground ,darkokai-orange
                           :weight bold
                           :italic t
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-orange
                                    :weight bold
                                    :italic t
                                    :underline t))))

   `(c-annotation-face
     ((,class (:inherit font-lock-constant-face))
      (,terminal-class (:inherit font-lock-constant-face))))

   ;; general colouring
   '(button ((t (:underline t))))

   `(default
      ((,class (:foreground ,darkokai-fg
                            :background ,darkokai-bg))
       (,terminal-class (:foreground ,terminal-darkokai-fg
                                     :background ,terminal-darkokai-bg))))

   `(highlight
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-highlight))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-highlight))))

   `(lazy-highlight
     ((,class (:inherit highlight
                        :background ,darkokai-comments))
      (,terminal-class (:inherit highlight
                                 :background ,terminal-darkokai-comments))))

   `(region
     ((,class (:inherit highlight
                        :background ,darkokai-highlight))
      (,terminal-class (:inherit highlight
                                 :background ,terminal-darkokai-highlight))))

   `(secondary-selection
     ((,class (:inherit region
                        :background ,darkokai-blue))
      (,terminal-class (:inherit region
                                 :background ,terminal-darkokai-blue))))

   `(shadow
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(match
     ((,class (:foreground ,darkokai-cyan-l
                           :background ,darkokai-cyan-d
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-cyan-l
                                    :foreground ,terminal-darkokai-cyan-d
                                    :weight bold))))

   `(cursor
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-fg
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-fg
                                    :inverse-video t))))

   `(mouse
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-fg
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-fg
                                    :inverse-video t))))

   `(escape-glyph
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(escape-glyph-face
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(fringe
     ((,class (:foreground ,darkokai-fg
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :background ,terminal-s-fringe-bg))))

   `(link
     ((,class (:foreground ,darkokai-blue
                           :underline t
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :underline t
                                    :weight bold))))

   `(link-visited
     ((,class (:foreground ,darkokai-violet
                           :underline t
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-violet
                                    :underline t
                                    :weight normal))))

   `(success
     ((,class (:foreground ,darkokai-green ))
      (,terminal-class (:foreground ,terminal-darkokai-green ))))

   `(warning
     ((,class (:foreground ,darkokai-yellow ))
      (,terminal-class (:foreground ,terminal-darkokai-yellow ))))

   `(error
     ((,class (:foreground ,darkokai-red-plain))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(eval-sexp-fu-flash
     ((,class (:foreground ,darkokai-cyan-l
                           :background ,darkokai-cyan-d))
      (,terminal-class (:foreground ,terminal-darkokai-cyan-l
                                    :background ,terminal-darkokai-cyan-d))))

   `(eval-sexp-fu-flash-error
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-red))))

   `(trailing-whitespace
     ((,class (:background ,darkokai-red))
      (,terminal-class (:background ,terminal-darkokai-red))))

   `(vertical-border
     ((,class (:foreground ,darkokai-gray))
      (,terminal-class (:foreground ,terminal-darkokai-gray))))

   `(menu
     ((,class (:foreground ,darkokai-fg
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :background ,terminal-darkokai-bg))))

   `(minibuffer-prompt
     ((,class (:foreground ,darkokai-violet-l))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   ;; menus and mode line
   `(mode-line
     ((,class (:inverse-video unspecified
                              :underline unspecified
                              :foreground ,s-mode-line-fg
                              :background ,s-mode-line-bg
                              :box (:line-width 8
                                                :color ,s-mode-line-bg
                                                :style unspecified)))
      (,terminal-class (:inverse-video unspecified
                                       :underline unspecified
                                       :foreground ,terminal-s-mode-line-fg
                                       :background ,terminal-s-mode-line-bg
                                       :box (:line-width 8
                                                         :color ,terminal-s-mode-line-bg
                                                         :style unspecified)))))

   `(mode-line-buffer-id
     ((,class (:foreground ,s-mode-line-buffer-id-fg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-s-mode-line-buffer-id-fg
                                    :weight bold))))

   `(mode-line-inactive
     ((,class (:inverse-video unspecified
                              :underline unspecified
                              :foreground ,s-mode-line-inactive-fg
                              :background ,s-mode-line-inactive-bg
                              :box (:line-width 8
                                                :color ,s-mode-line-inactive-bg
                                                :style unspecified)))
      (,terminal-class (:inverse-video unspecified
                                       :underline unspecified
                                       :foreground ,terminal-s-mode-line-inactive-fg
                                       :background ,terminal-s-mode-line-inactive-bg
                                       :box (:line-width 1
                                                         :color ,terminal-s-mode-line-inactive-bc
                                                         :style unspecified)))))

   `(header-line
     ((,class (:inverse-video unspecified
                              :underline unspecified
                              :foreground ,darkokai-emph
                              :background ,darkokai-highlight-line
                              :box (:line-width 1
                                                :color ,darkokai-gray
                                                :style unspecified)))
      (,terminal-class (:inverse-video unspecified
                                       :underline unspecified
                                       :foreground ,terminal-darkokai-emph
                                       :background ,terminal-darkokai-highlight-line
                                       :box (:line-width 1
                                                         :color ,terminal-darkokai-gray
                                                         :style unspecified)))))

   ;; cua
   `(cua-global-mark
     ((,class (:background ,darkokai-yellow
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-yellow
                                    :foreground ,terminal-darkokai-bg))))

   `(cua-rectangle
     ((,class (:inherit region))
      (,terminal-class (:inherit region))))

   `(cua-rectangle-noselect
     ((,class (:inherit secondary-selection))
      (,terminal-class (:inherit secondary-selection))))

   ;; diary
   `(diary
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   ;; dired
   `(dired-directory
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(dired-flagged
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(dired-header
     ((,class (:foreground ,darkokai-blue
                           :background ,darkokai-bg
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :background ,terminal-darkokai-bg
                                    :inherit bold))))

   `(dired-ignored
     ((,class (:inherit shadow))
      (,terminal-class (:inherit shadow))))

   `(dired-mark
     ((,class (:foreground ,darkokai-green
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :weight bold))))

   `(dired-marked
     ((,class (:foreground ,darkokai-violet
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-darkokai-violet
                                    :inherit bold))))

   `(dired-perm-write
     ((,class (:foreground ,darkokai-fg
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :underline t))))

   `(dired-symlink
     ((,class (:foreground ,darkokai-cyan
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :slant italic))))

   `(dired-warning
     ((,class (:foreground ,darkokai-orange
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-orange
                                    :underline t))))

   ;; dropdown
   `(dropdown-list-face
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-blue))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-blue))))

   `(dropdown-list-selection-face
     ((,class (:background ,darkokai-green
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-green
                                    :foreground ,terminal-darkokai-bg))))

   ;; ecb
   `(ecb-default-highlight-face
     ((,class (:background ,darkokai-blue
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-blue
                                    :foreground ,terminal-darkokai-bg))))

   `(ecb-history-bucket-node-dir-soure-path-face
     ((,class (:inherit ecb-history-bucket-node-face
                        :foreground ,darkokai-yellow))
      (,terminal-class (:inherit ecb-history-bucket-node-face
                                 :foreground ,terminal-darkokai-yellow))))

   `(ecb-source-in-directories-buffer-face
     ((,class (:inherit ecb-directories-general-face
                        :foreground ,darkokai-fg))
      (,terminal-class (:inherit ecb-directories-general-face
                                 :foreground ,terminal-darkokai-fg))))

   `(ecb-history-dead-buffer-face
     ((,class (:inherit ecb-history-general-face
                        :foreground ,darkokai-comments))
      (,terminal-class (:inherit ecb-history-general-face
                                 :foreground ,terminal-darkokai-comments))))

   `(ecb-directory-not-accessible-face
     ((,class (:inherit ecb-directories-general-face
                        :foreground ,darkokai-comments))
      (,terminal-class (:inherit ecb-directories-general-face
                                 :foreground ,terminal-darkokai-comments))))

   `(ecb-bucket-node-face
     ((,class (:inherit ecb-default-general-face
                        :weight normal
                        :foreground ,darkokai-blue))
      (,terminal-class (:inherit ecb-default-general-face
                                 :weight normal
                                 :foreground ,terminal-darkokai-blue))))

   `(ecb-tag-header-face
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   `(ecb-analyse-bucket-element-face
     ((,class (:inherit ecb-analyse-general-face
                        :foreground ,darkokai-green))
      (,terminal-class (:inherit ecb-analyse-general-face
                                 :foreground ,terminal-darkokai-green))))

   `(ecb-directories-general-face
     ((,class (:inherit ecb-default-general-face
                        :height 1.0))
      (,terminal-class (:inherit ecb-default-general-face
                                 :height 1.0))))

   `(ecb-method-non-semantic-face
     ((,class (:inherit ecb-methods-general-face
                        :foreground ,darkokai-cyan))
      (,terminal-class (:inherit ecb-methods-general-face
                                 :foreground ,terminal-darkokai-cyan))))

   `(ecb-mode-line-prefix-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(ecb-tree-guide-line-face
     ((,class (:inherit ecb-default-general-face
                        :foreground ,darkokai-gray
                        :height 1.0))
      (,terminal-class (:inherit ecb-default-general-face
                                 :foreground ,terminal-darkokai-gray
                                 :height 1.0))))

   ;; ee
   `(ee-bookmarked
     ((,class (:foreground ,darkokai-emph))
      (,terminal-class (:foreground ,terminal-darkokai-emph))))

   `(ee-category
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(ee-link
     ((,class (:inherit link))
      (,terminal-class (:inherit link))))

   `(ee-link-visited
     ((,class (:inherit link-visited))
      (,terminal-class (:inherit link-visited))))

   `(ee-marked
     ((,class (:foreground ,darkokai-magenta
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-magenta
                                    :weight bold))))

   `(ee-omitted
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(ee-shadow
     ((,class (:inherit shadow))
      (,terminal-class (:inherit shadow))))

   ;; elixir
   `(elixir-atom-face
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   `(elixir-attribute-face
     ((,class (:foreground ,darkokai-violet-l))
      (,terminal-class (:foreground ,terminal-darkokai-violet-l))))

   ;; grep
   `(grep-context-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(grep-error-face
     ((,class (:foreground ,darkokai-red
                           :weight bold
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :weight bold
                                    :underline t))))

   `(grep-hit-face
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(grep-match-face
     ((,class (:foreground ,darkokai-green
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :weight bold))))

   ;; isearch
   `(isearch
     ((,class (:foreground ,darkokai-cyan-l
                        :background ,darkokai-cyan-d))
      (,terminal-class (:foreground ,terminal-darkokai-cyan-l
                                 :background ,terminal-darkokai-cyan-d))))

   `(isearch-fail
     ((,class (:inherit isearch
                        :foreground ,darkokai-red
                        :background ,darkokai-bg
                        :bold t))
      (,terminal-class (:inherit isearch
                                 :foreground ,terminal-darkokai-red
                                 :background ,terminal-darkokai-bg
                                 :bold t))))


   ;; ace-jump-mode
   `(ace-jump-face-background
     ((,class (:foreground ,darkokai-comments
                           :background ,darkokai-bg
                           :inverse-video nil))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :background ,terminal-darkokai-bg
                                    :inverse-video nil))))

   `(ace-jump-face-foreground
     ((,class (:foreground ,darkokai-yellow
                           :background ,darkokai-bg
                           :inverse-video nil
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :background ,terminal-darkokai-bg
                                    :inverse-video nil
                                    :weight bold))))

   ;; alchemist
   `(alchemist-test--failed-face
     ((,class (:foreground ,darkokai-red-hc
                           :background ,darkokai-red-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-red-hc
                                    :background ,terminal-darkokai-red-lc
                                    :weight bold))))

   `(alchemist-test--success-face
     ((,class (:foreground ,darkokai-fg
                           :background ,darkokai-green-plain
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :background ,terminal-darkokai-green-l
                                    :weight bold))))


   ;; auctex
   `(font-latex-bold-face
     ((,class (:inherit bold
                        :foreground ,darkokai-emph))
      (,terminal-class (:inherit bold
                                 :foreground ,terminal-darkokai-emph))))

   `(font-latex-doctex-documentation-face
     ((,class (:background unspecified))
      (,terminal-class (:background unspecified))))

   `(font-latex-doctex-preprocessor-face
     ((,class
       (:inherit (font-latex-doctex-documentation-face
                  font-lock-builtin-face
                  font-lock-preprocessor-face)))
      (,class
       (:inherit (font-latex-doctex-documentation-face
                  font-lock-builtin-face
                  font-lock-preprocessor-face)))))

   `(font-latex-italic-face
     ((,class (:inherit italic :foreground ,darkokai-emph))
      (,terminal-class (:inherit italic :foreground ,terminal-darkokai-emph))))

   `(font-latex-math-face
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   `(font-latex-sectioning-0-face
     ((,class (:inherit font-latex-sectioning-1-face
                        :height ,darkokai-height-plus-1))
      (,terminal-class (:inherit font-latex-sectioning-1-face
                                 :height ,darkokai-height-plus-1))))

   `(font-latex-sectioning-1-face
     ((,class (:inherit font-latex-sectioning-2-face
                        :height ,darkokai-height-plus-1))
      (,terminal-class (:inherit font-latex-sectioning-2-face
                                 :height ,darkokai-height-plus-1))))

   `(font-latex-sectioning-2-face
     ((,class (:inherit font-latex-sectioning-3-face
                        :height ,darkokai-height-plus-1))
      (,terminal-class (:inherit font-latex-sectioning-3-face
                                 :height ,darkokai-height-plus-1))))

   `(font-latex-sectioning-3-face
     ((,class (:inherit font-latex-sectioning-4-face
                        :height ,darkokai-height-plus-1))
      (,terminal-class (:inherit font-latex-sectioning-4-face
                                 :height ,darkokai-height-plus-1))))

   `(font-latex-sectioning-4-face
     ((,class (:inherit font-latex-sectioning-5-face
                        :height ,darkokai-height-plus-1))
      (,terminal-class (:inherit font-latex-sectioning-5-face
                                 :height ,darkokai-height-plus-1))))

   `(font-latex-sectioning-5-face
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-yellow
                        :weight bold))
      (,terminal-class (:inherit ,terminal-s-variable-pitch :
                                 foreground ,terminal-darkokai-yellow
                                 :weight bold))))

   `(font-latex-sedate-face
     ((,class (:foreground ,darkokai-emph))
      (,terminal-class (:foreground ,terminal-darkokai-emph))))

   `(font-latex-slide-title-face
     ((,class (:inherit (,s-variable-pitch font-lock-type-face)
                        :weight bold
                        :height ,darkokai-height-plus-3))
      (,terminal-class (:inherit (,terminal-s-variable-pitch font-lock-type-face)
                                 :weight bold
                                 :height ,darkokai-height-plus-3))))

   `(font-latex-string-face
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(font-latex-subscript-face
     ((,class (:height ,darkokai-height-minus-1))
      (,terminal-class (:height ,darkokai-height-minus-1))))

   `(font-latex-superscript-face
     ((,class (:height ,darkokai-height-minus-1))
      (,terminal-class (:height ,darkokai-height-minus-1))))

   `(font-latex-verbatim-face
     ((,class (:inherit fixed-pitch
                        :foreground ,darkokai-fg
                        :slant italic))
      (,terminal-class (:inherit fixed-pitch
                                 :foreground ,terminal-darkokai-fg
                                 :slant italic))))

   `(font-latex-warning-face
     ((,class (:inherit bold
                        :foreground ,darkokai-orange))
      (,terminal-class (:inherit bold
                                 :foreground ,terminal-darkokai-orange))))

   ;; auto-complete
   `(ac-candidate-face
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-blue))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-blue))))

   `(ac-selection-face
     ((,class (:background ,darkokai-blue
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-blue
                                    :foreground ,terminal-darkokai-bg))))

   `(ac-candidate-mouse-face
     ((,class (:background ,darkokai-blue
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-blue
                                    :foreground ,terminal-darkokai-bg))))

   `(ac-completion-face
     ((,class (:foreground ,darkokai-emph
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :underline t))))

   `(ac-gtags-candidate-face
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-blue))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-blue))))

   `(ac-gtags-selection-face
     ((,class (:background ,darkokai-blue
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-blue
                                    :foreground ,terminal-darkokai-bg))))

   `(ac-yasnippet-candidate-face
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-yellow))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-yellow))))

   `(ac-yasnippet-selection-face
     ((,class (:background ,darkokai-yellow
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-yellow
                                    :foreground ,terminal-darkokai-bg))))

   ;; auto highlight symbol
   `(ahs-definition-face
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-blue))))

   `(ahs-edit-mode-face
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-highlight))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-highlight))))

   `(ahs-face
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-magenta
                                    :background unspecified))))

   `(ahs-plugin-bod-face
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-violet ))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-cyan ))))

   `(ahs-plugin-defalt-face
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-orange))))

   `(ahs-plugin-whole-buffer-face
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-green))))

   `(ahs-warning-face
     ((,class (:foreground ,darkokai-red
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :weight bold))))

   ;; android mode
   `(android-mode-debug-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(android-mode-error-face
     ((,class (:foreground ,darkokai-orange
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-orange
                                    :weight bold))))

   `(android-mode-info-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(android-mode-verbose-face
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(android-mode-warning-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   ;; anzu-mode
   `(anzu-mode-line
     ((,class (:foreground ,darkokai-violet
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-violet
                                    :weight bold))))

   ;; bm
   `(bm-face
     ((,class (:background ,darkokai-yellow-lc
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-yellow-lc
                                    :foreground ,terminal-darkokai-bg))))

   `(bm-fringe-face
     ((,class (:background ,darkokai-yellow-lc
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-yellow-lc
                                    :foreground ,terminal-darkokai-bg))))

   `(bm-fringe-persistent-face
     ((,class (:background ,darkokai-green-lc
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-green-lc
                                    :foreground ,terminal-darkokai-bg))))

   `(bm-persistent-face
     ((,class (:background ,darkokai-green-lc
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-green-lc
                                    :foreground ,terminal-darkokai-bg))))

   ;; calfw
   `(cfw:face-day-title
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   `(cfw:face-annotation
     ((,class (:inherit cfw:face-day-title
                        :foreground ,darkokai-yellow))
      (,terminal-class (:inherit cfw:face-day-title
                                 :foreground ,terminal-darkokai-yellow))))

   `(cfw:face-default-content
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(cfw:face-default-day
     ((,class (:inherit cfw:face-day-title
                        :weight bold))
      (,terminal-class (:inherit cfw:face-day-title
                                 :weight bold))))

   `(cfw:face-disable
     ((,class (:inherit cfw:face-day-title
                        :foreground ,darkokai-comments))
      (,terminal-class (:inherit cfw:face-day-title
                                 :foreground ,terminal-darkokai-comments))))

   `(cfw:face-grid
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(cfw:face-header
     ((,class (:foreground ,darkokai-blue-hc
                           :background ,darkokai-blue-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue-hc
                                    :background ,terminal-darkokai-blue-lc
                                    :weight bold))))

   `(cfw:face-holiday
     ((,class (:background nil
                           :foreground ,darkokai-red
                           :weight bold))
      (,terminal-class (:background nil
                                    :foreground ,terminal-darkokai-red
                                    :weight bold))))

   `(cfw:face-periods
     ((,class (:foreground ,darkokai-magenta))
      (,terminal-class (:foreground ,terminal-darkokai-magenta))))

   `(cfw:face-select
     ((,class (:background ,darkokai-magenta-lc
                           :foreground ,darkokai-magenta-hc))
      (,terminal-class (:background ,terminal-darkokai-magenta-lc
                                    :foreground ,terminal-darkokai-magenta-hc))))

   `(cfw:face-saturday
     ((,class (:foreground ,darkokai-cyan-hc
                           :background ,darkokai-cyan-lc))
      (,terminal-class (:foreground ,terminal-darkokai-cyan-hc
                                    :background ,terminal-darkokai-cyan-lc))))

   `(cfw:face-sunday
     ((,class (:foreground ,darkokai-red-hc
                           :background ,darkokai-red-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-red-hc
                                    :background ,terminal-darkokai-red-lc
                                    :weight bold))))

   `(cfw:face-title
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-yellow
                        :weight bold
                        :height ,darkokai-height-plus-4))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-yellow
                                 :weight bold
                                 :height ,darkokai-height-plus-4))))

   `(cfw:face-today
     ((,class (:weight bold
                       :background ,darkokai-highlight-line
                       :foreground nil))
      (,terminal-class (:weight bold
                                :background ,terminal-darkokai-highlight-line
                                :foreground nil))))

   `(cfw:face-today-title
     ((,class (:background ,darkokai-yellow-lc
                           :foreground ,darkokai-yellow-hc
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-yellow-lc
                                    :foreground ,terminal-darkokai-yellow-hc
                                    :weight bold))))

   `(cfw:face-toolbar
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-fg))))

   `(cfw:face-toolbar-button-off
     ((,class (:background ,darkokai-yellow-lc
                           :foreground ,darkokai-yellow-hc
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-yellow-lc
                                    :foreground ,terminal-darkokai-yellow-hc
                                    :weight bold))))

   `(cfw:face-toolbar-button-on
     ((,class (:background ,darkokai-yellow-hc
                           :foreground ,darkokai-yellow-lc
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-yellow-hc
                                    :foreground ,terminal-darkokai-yellow-lc
                                    :weight bold))))

   ;; cider
   `(cider-enlightened
     ((,class (:foreground ,darkokai-yellow
                           :background nil
                           :box (:color ,darkokai-yellow :line-width -1 :style nil)))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :background nil
                                    :box (:color ,terminal-darkokai-yellow :line-width -1 :style nil))) ))

   `(cider-enlightened-local
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(cider-instrumented-face
     ((,class (:foreground ,darkokai-violet
                           :background nil
                           :box (:color ,darkokai-violet :line-width -1 :style nil)))
      (,terminal-class (:foreground ,terminal-darkokai-violet
                                    :background nil
                                    :box (:color ,terminal-darkokai-violet :line-width -1 :style nil)))))

   `(cider-result-overlay-face
     ((,class (:foreground ,darkokai-blue
                           :background nil
                           :box (:color ,darkokai-blue :line-width -1 :style nil)))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :background nil
                                    :box (:color ,terminal-darkokai-blue :line-width -1 :style nil)))))

   `(cider-test-error-face
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-orange))))

   `(cider-test-failure-face
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-red))))

   `(cider-test-success-face
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-green))))

   `(cider-traced-face
     ((,class :box (:color ,darkokai-blue :line-width -1 :style nil))
      (,terminal-class :box (:color ,terminal-darkokai-blue :line-width -1 :style nil))))

   ;; clojure-test
   `(clojure-test-failure-face
     ((,class (:foreground ,darkokai-red
                           :weight bold
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :weight bold
                                    :underline t))))

   `(clojure-test-error-face
     ((,class (:foreground ,darkokai-orange
                           :weight bold
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :weight bold
                                    :underline t))))

   `(clojure-test-success-face
     ((,class (:foreground ,darkokai-green
                           :weight bold
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :weight bold
                                    :underline t))))

   ;; company-mode
   `(company-tooltip
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-emph))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-emph))))

   `(company-tooltip-selection
     ((,class (:background ,darkokai-cyan-d
                           :foreground ,darkokai-cyan-l))
      (,terminal-class (:background ,terminal-darkokai-cyan-d
                                    :foreground ,terminal-darkokai-cyan-l))))

   `(company-tooltip-mouse
     ((,class (:background ,darkokai-blue
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-blue
                                    :foreground ,terminal-darkokai-bg))))

   `(company-tooltip-common
     ((,class (:foreground ,darkokai-violet
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-violet
                                    :underline t))))

   `(company-tooltip-common-selection
     ((,class (:foreground ,darkokai-fg
                           :background ,darkokai-cyan-d
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :background ,terminal-darkokai-cyan-d
                                    :underline t))))

   `(company-preview
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-emph))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-emph))))

   `(company-preview-common
     ((,class (:foreground ,darkokai-blue
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :underline t))))

   `(company-scrollbar-bg
     ((,class (:background ,darkokai-gray))
      (,terminal-class (:background ,terminal-darkokai-gray))))

   `(company-scrollbar-fg
     ((,class (:background ,darkokai-comments))
      (,terminal-class (:background ,terminal-darkokai-comments))))

   `(company-tooltip-annotation
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(company-template-field
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-blue))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-blue))))

   ;; compilation
   `(compilation-column-face
     ((,class (:foreground ,darkokai-cyan
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :underline nil))))

   `(compilation-column-number
     ((,class (:inherit font-lock-doc-face
                        :foreground ,darkokai-cyan
                        :underline nil))
      (,terminal-class (:inherit font-lock-doc-face
                                 :foreground ,terminal-darkokai-cyan
                                 :underline nil))))

   `(compilation-enter-directory-face
     ((,class (:foreground ,darkokai-green
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :underline nil))))

   `(compilation-error
     ((,class (:inherit error
                        :underline nil))
      (,terminal-class (:inherit error
                                 :underline nil))))

   `(compilation-error-face
     ((,class (:foreground ,darkokai-red
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :underline nil))))

   `(compilation-face
     ((,class (:foreground ,darkokai-fg
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :underline nil))))

   `(compilation-info
     ((,class (:foreground ,darkokai-comments
                           :underline nil
                           :bold nil))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :underline nil
                                    :bold nil))))

   `(compilation-info-face
     ((,class (:foreground ,darkokai-blue
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :underline nil))))

   `(compilation-leave-directory-face
     ((,class (:foreground ,darkokai-green
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :underline nil))))

   `(compilation-line-face
     ((,class (:foreground ,darkokai-green
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :underline nil))))

   `(compilation-line-number
     ((,class (:foreground ,darkokai-green
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :underline nil))))

   `(compilation-warning
     ((,class (:inherit warning
                        :underline nil))
      (,terminal-class (:inherit warning
                                 :underline nil))))

   `(compilation-warning-face
     ((,class (:foreground ,darkokai-yellow
                           :weight normal
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight normal
                                    :underline nil))))

   `(compilation-mode-line-exit
     ((,class (:inherit compilation-info
                        :foreground ,darkokai-green
                        :weight bold))
      (,terminal-class (:inherit compilation-info
                                 :foreground ,terminal-darkokai-green
                                 :weight bold))))

   `(compilation-mode-line-fail
     ((,class (:inherit compilation-error
                        :foreground ,darkokai-red
                        :weight bold))
      (,terminal-class (:inherit compilation-error
                                 :foreground ,terminal-darkokai-red
                                 :weight bold))))

   `(compilation-mode-line-run
     ((,class (:foreground ,darkokai-orange
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-orange
                                    :weight bold))))

   ;; CSCOPE
   `(cscope-file-face
     ((,class (:foreground ,darkokai-green
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :weight bold))))

   `(cscope-function-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(cscope-line-number-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(cscope-line-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(cscope-mouse-face
     ((,class (:background ,darkokai-blue
                           :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-blue
                                    :foreground ,terminal-darkokai-fg))))

   ;; ctable
   `(ctbl:face-cell-select
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-emph
                           :underline ,darkokai-emph
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-emph
                                    :underline ,terminal-darkokai-emph
                                    :weight bold))))

   `(ctbl:face-continue-bar
     ((,class (:background ,darkokai-gray
                           :foreground ,darkokai-yellow))
      (,terminal-class (:background ,terminal-darkokai-gray
                                    :foreground ,terminal-darkokai-yellow))))

   `(ctbl:face-row-select
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-fg
                           :underline t))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-fg
                                    :underline t))))

   ;; coffee
   `(coffee-mode-class-name
     ((,class (:foreground ,darkokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight bold))))

   `(coffee-mode-function-param
     ((,class (:foreground ,darkokai-violet
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-violet
                                    :slant italic))))

   ;; custom
   `(custom-face-tag
     ((,class (:inherit ,s-variable-pitch
                        :height ,darkokai-height-plus-3
                        :foreground ,darkokai-violet
                        :weight bold))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :height ,darkokai-height-plus-3
                                 :foreground ,terminal-darkokai-violet
                                 :weight bold))))

   `(custom-variable-tag
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-cyan
                        :height ,darkokai-height-plus-3))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-cyan
                                 :height ,darkokai-height-plus-3))))

   `(custom-comment-tag
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(custom-group-tag
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-blue
                        :height ,darkokai-height-plus-3))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-blue
                                 :height ,darkokai-height-plus-3))))

   `(custom-group-tag-1
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-red
                        :height ,darkokai-height-plus-3))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-red
                                 :height ,darkokai-height-plus-3))))

   `(custom-state
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   ;; diff
   `(diff-added
     ((,class (:foreground ,darkokai-green-plain
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :background ,terminal-darkokai-bg))))

   `(diff-changed
     ((,class (:foreground ,darkokai-blue
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :background ,terminal-darkokai-bg))))

   `(diff-removed
     ((,class (:foreground ,darkokai-red-plain
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :background ,terminal-darkokai-bg))))

   `(diff-header
     ((,class (:background ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-bg))))

   `(diff-file-header
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-fg
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-fg
                                    :weight bold))))

   `(diff-refine-added
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-green-plain))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-green))))

   `(diff-refine-change
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-blue))))

   `(diff-refine-removed
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-red-plain))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-red))))

   ;; diff-hl
   `(diff-hl-change
     ((,class (:background ,darkokai-blue-lc
                           :foreground ,darkokai-blue-hc))
      (,terminal-class (:background ,terminal-darkokai-blue-lc
                                    :foreground ,terminal-darkokai-blue-hc))))

   `(diff-hl-delete
     ((,class (:background ,darkokai-red-lc
                           :foreground ,darkokai-red-hc))
      (,terminal-class (:background ,terminal-darkokai-red-lc
                                    :foreground ,terminal-darkokai-red-hc))))

   `(diff-hl-insert
     ((,class (:background ,darkokai-green-lc
                           :foreground ,darkokai-green-hc))
      (,terminal-class (:background ,terminal-darkokai-green-lc
                                    :foreground ,terminal-darkokai-green-hc))))

   `(diff-hl-unknown
     ((,class (:background ,darkokai-violet-lc
                           :foreground ,darkokai-violet-hc))
      (,terminal-class (:background ,terminal-darkokai-violet-lc
                                    :foreground ,terminal-darkokai-violet-hc))))

   ;; ediff
   `(ediff-fine-diff-A
     ((,class (:background ,darkokai-orange-lc))
      (,terminal-class (:background ,terminal-darkokai-orange-lc))))

   `(ediff-fine-diff-B
     ((,class (:background ,darkokai-green-lc))
      (,terminal-class (:background ,terminal-darkokai-green-lc))))

   `(ediff-fine-diff-C
     ((,class (:background ,darkokai-yellow-lc))
      (,terminal-class (:background ,terminal-darkokai-yellow-lc))))

   `(ediff-current-diff-C
     ((,class (:background ,darkokai-blue-lc))
      (,terminal-class (:background ,terminal-darkokai-blue-lc))))

   `(ediff-even-diff-A
     ((,class (:background ,darkokai-comments
                           :foreground ,darkokai-fg-lc ))
      (,terminal-class (:background ,terminal-darkokai-comments
                                    :foreground ,terminal-darkokai-fg-lc ))))

   `(ediff-odd-diff-A
     ((,class (:background ,darkokai-comments
                           :foreground ,darkokai-fg-hc ))
      (,terminal-class (:background ,terminal-darkokai-comments
                                    :foreground ,terminal-darkokai-fg-hc ))))

   `(ediff-even-diff-B
     ((,class (:background ,darkokai-comments
                           :foreground ,darkokai-fg-hc ))
      (,terminal-class (:background ,terminal-darkokai-comments
                                    :foreground ,terminal-darkokai-fg-hc ))))

   `(ediff-odd-diff-B
     ((,class (:background ,darkokai-comments
                           :foreground ,darkokai-fg-lc ))
      (,terminal-class (:background ,terminal-darkokai-comments
                                    :foreground ,terminal-darkokai-fg-lc ))))

   `(ediff-even-diff-C
     ((,class (:background ,darkokai-comments
                           :foreground ,darkokai-fg ))
      (,terminal-class (:background ,terminal-darkokai-comments
                                    :foreground ,terminal-darkokai-fg ))))

   `(ediff-odd-diff-C
     ((,class (:background ,darkokai-comments
                           :foreground ,darkokai-bg ))
      (,terminal-class (:background ,terminal-darkokai-comments
                                    :foreground ,terminal-darkokai-bg ))))

   ;; edts
   `(edts-face-error-line
     ((,(append '((supports :underline (:style line))) class)
       (:underline (:style line :color ,darkokai-red)
                   :inherit unspecified))
      (,class (:foreground ,darkokai-red-hc
                           :background ,darkokai-red-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style line))) terminal-class)
       (:underline (:style line :color ,terminal-darkokai-red)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-red-hc
                                    :background ,terminal-darkokai-red-lc
                                    :weight bold
                                    :underline t))))

   `(edts-face-warning-line
     ((,(append '((supports :underline (:style line))) class)
       (:underline (:style line :color ,darkokai-yellow)
                   :inherit unspecified))
      (,class (:foreground ,darkokai-yellow-hc
                           :background ,darkokai-yellow-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style line))) terminal-class)
       (:underline (:style line :color ,terminal-darkokai-yellow)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-yellow-hc
                                    :background ,terminal-darkokai-yellow-lc
                                    :weight bold
                                    :underline t))))

   `(edts-face-error-fringe-bitmap
     ((,class (:foreground ,darkokai-red
                           :background unspecified
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :background unspecified
                                    :weight bold))))

   `(edts-face-warning-fringe-bitmap
     ((,class (:foreground ,darkokai-yellow
                           :background unspecified
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :background unspecified
                                    :weight bold))))

   `(edts-face-error-mode-line
     ((,class (:background ,darkokai-red
                           :foreground unspecified))
      (,terminal-class (:background ,terminal-darkokai-red
                                    :foreground unspecified))))

   `(edts-face-warning-mode-line
     ((,class (:background ,darkokai-yellow
                           :foreground unspecified))
      (,terminal-class (:background ,terminal-darkokai-yellow
                                    :foreground unspecified))))


   ;; elfeed
   `(elfeed-search-date-face
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(elfeed-search-feed-face
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(elfeed-search-tag-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(elfeed-search-title-face
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   ;; ein
   `(ein:cell-input-area
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))
   `(ein:cell-input-prompt
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))
   `(ein:cell-output-prompt
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))
   `(ein:notification-tab-normal
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))
   `(ein:notification-tab-selected
     ((,class (:foreground ,darkokai-orange :inherit bold))
      (,terminal-class (:foreground ,terminal-darkokai-orange :inherit bold))))

   ;; enhanced ruby mode
   `(enh-ruby-string-delimiter-face
     ((,class (:inherit font-lock-string-face))
      (,terminal-class (:inherit font-lock-string-face))))

   `(enh-ruby-heredoc-delimiter-face
     ((,class (:inherit font-lock-string-face))
      (,terminal-class (:inherit font-lock-string-face))))

   `(enh-ruby-regexp-delimiter-face
     ((,class (:inherit font-lock-string-face))
      (,terminal-class (:inherit font-lock-string-face))))

   `(enh-ruby-op-face
     ((,class (:inherit font-lock-keyword-face))
      (,terminal-class (:inherit font-lock-keyword-face))))

   ;; erm-syn
   `(erm-syn-errline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkokai-red)
                   :inherit unspecified))
      (,class (:foreground ,darkokai-red-hc
                           :background ,darkokai-red-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkokai-red)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-red-hc
                                    :background ,terminal-darkokai-red-lc
                                    :weight bold
                                    :underline t))))

   `(erm-syn-warnline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkokai-orange)
                   :inherit unspecified))
      (,class (:foreground ,darkokai-orange-hc
                           :background ,darkokai-orange-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkokai-orange)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-orange-hc
                                    :background ,terminal-darkokai-orange-lc
                                    :weight bold
                                    :underline t))))

   ;; epc
   `(epc:face-title
     ((,class (:foreground ,darkokai-blue
                           :background ,darkokai-bg
                           :weight normal
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :background ,terminal-darkokai-bg
                                    :weight normal
                                    :underline nil))))

   ;; erc
   `(erc-action-face
     ((,class (:inherit erc-default-face))
      (,terminal-class (:inherit erc-default-face))))

   `(erc-bold-face
     ((,class (:weight bold))
      (,terminal-class (:weight bold))))

   `(erc-current-nick-face
     ((,class (:foreground ,darkokai-blue :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :weight bold))))

   `(erc-dangerous-host-face
     ((,class (:inherit font-lock-warning-face))
      (,terminal-class (:inherit font-lock-warning-face))))

   `(erc-default-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(erc-highlight-face
     ((,class (:inherit erc-default-face
                        :background ,darkokai-highlight))
      (,terminal-class (:inherit erc-default-face
                                 :background ,terminal-darkokai-highlight))))

   `(erc-direct-msg-face
     ((,class (:inherit erc-default-face))
      (,terminal-class (:inherit erc-default-face))))

   `(erc-error-face
     ((,class (:inherit font-lock-warning-face))
      (,terminal-class (:inherit font-lock-warning-face))))

   `(erc-fool-face
     ((,class (:inherit erc-default-face))
      (,terminal-class (:inherit erc-default-face))))

   `(erc-input-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(erc-keyword-face
     ((,class (:foreground ,darkokai-blue
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :weight bold))))

   `(erc-nick-default-face
     ((,class (:foreground ,darkokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight bold))))

   `(erc-my-nick-face
     ((,class (:foreground ,darkokai-red
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :weight bold))))

   `(erc-nick-msg-face
     ((,class (:inherit erc-default-face))
      (,terminal-class (:inherit erc-default-face))))

   `(erc-notice-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(erc-pal-face
     ((,class (:foreground ,darkokai-orange
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-orange
                                    :weight bold))))

   `(erc-prompt-face
     ((,class (:foreground ,darkokai-orange
                           :background ,darkokai-bg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-orange
                                    :background ,terminal-darkokai-bg
                                    :weight bold))))

   `(erc-timestamp-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(erc-underline-face
     ((t (:underline t))))

   ;; eshell
   `(eshell-prompt
     ((,class (:foreground ,darkokai-blue
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :inherit bold))))

   `(eshell-ls-archive
     ((,class (:foreground ,darkokai-red
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :inherit bold))))

   `(eshell-ls-backup
     ((,class (:inherit font-lock-comment-face))
      (,terminal-class (:inherit font-lock-comment-face))))

   `(eshell-ls-clutter
     ((,class (:inherit font-lock-comment-face))
      (,terminal-class (:inherit font-lock-comment-face))))

   `(eshell-ls-directory
     ((,class (:foreground ,darkokai-blue
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :inherit bold))))

   `(eshell-ls-executable
     ((,class (:foreground ,darkokai-green
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :inherit bold))))

   `(eshell-ls-unreadable
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(eshell-ls-missing
     ((,class (:inherit font-lock-warning-face))
      (,terminal-class (:inherit font-lock-warning-face))))

   `(eshell-ls-product
     ((,class (:inherit font-lock-doc-face))
      (,terminal-class (:inherit font-lock-doc-face))))

   `(eshell-ls-special
     ((,class (:foreground ,darkokai-yellow
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :inherit bold))))

   `(eshell-ls-symlink
     ((,class (:foreground ,darkokai-cyan
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :inherit bold))))

   ;; evil-ex-substitute
   `(evil-ex-substitute-matches
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-red-l
                           :inherit italic))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-red-l
                                    :inherit italic))))
   `(evil-ex-substitute-replacement
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-green-l
                           :inherit italic))
      (,terminal-class (:background ,terminal-darkokai-highlight-line :foreground ,terminal-darkokai-green-l :inherit italic))))

   ;; evil-search-highlight-persist
   `(evil-search-highlight-persist-highlight-face
     ((,class (:inherit region))
      (,terminal-class (:inherit region))))

   ;; fic
   `(fic-author-face
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-orange
                           :underline t
                           :slant italic))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-orange
                                    :underline t
                                    :slant italic))))

   `(fic-face
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-orange
                           :weight normal
                           :slant italic))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-orange
                                    :weight normal
                                    :slant italic))))

   `(font-lock-fic-face
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-orange
                           :weight normal
                           :slant italic))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-orange
                                    :weight normal
                                    :slant italic))))

   ;; flx
   `(flx-highlight-face
     ((,class (:foreground ,darkokai-cyan
                           :weight normal
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :weight normal
                                    :underline t))))

   ;; flymake
   `(flymake-errline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkokai-red)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,class (:foreground ,darkokai-red-hc
                           :background ,darkokai-red-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkokai-red)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-red-hc
                                    :background ,terminal-darkokai-red-lc
                                    :weight bold
                                    :underline t))))

   `(flymake-infoline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkokai-green)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,class (:foreground ,darkokai-green-hc
                           :background ,darkokai-green-lc))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkokai-green)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-green-hc
                                    :background ,terminal-darkokai-green-lc))))

   `(flymake-warnline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkokai-yellow)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,class (:foreground ,darkokai-yellow-hc
                           :background ,darkokai-yellow-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkokai-yellow)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-yellow-hc
                                    :background ,terminal-darkokai-yellow-lc
                                    :weight bold
                                    :underline t))))

   ;; flycheck
   `(flycheck-error
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkokai-red)
                   :inherit unspecified))
      (,class (:foreground ,darkokai-red-hc
                           :background ,darkokai-red-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkokai-red)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-red-hc
                                    :background ,terminal-darkokai-red-lc
                                    :weight bold
                                    :underline t))))

   `(flycheck-warning
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkokai-yellow)
                   :inherit unspecified))
      (,class (:foreground ,darkokai-yellow-hc
                           :background ,darkokai-yellow-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkokai-yellow)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-yellow-hc
                                    :background ,terminal-darkokai-yellow-lc
                                    :weight bold
                                    :underline t))))

   `(flycheck-info
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkokai-blue)
                   :inherit unspecified))
      (,class (:foreground ,darkokai-blue-hc
                           :background ,darkokai-blue-lc
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkokai-blue)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-blue-hc
                                    :background ,terminal-darkokai-blue-lc
                                    :weight bold
                                    :underline t))))

   `(flycheck-fringe-error
     ((,class (:foreground ,darkokai-red-hc
                           :background ,darkokai-red-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-red-hc
                                    :background ,terminal-darkokai-red-lc
                                    :weight bold))))

   `(flycheck-fringe-warning
     ((,class (:foreground ,darkokai-yellow-hc
                           :background ,darkokai-yellow-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow-hc
                                    :background ,terminal-darkokai-yellow-lc
                                    :weight bold))))

   `(flycheck-fringe-info
     ((,class (:foreground ,darkokai-blue-hc
                           :background ,darkokai-blue-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue-hc
                                    :background ,terminal-darkokai-blue-lc
                                    :weight bold))))

   ;; flyspell
   `(flyspell-duplicate
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkokai-yellow)
                   :inherit unspecified))
      (,class (:foreground ,darkokai-yellow
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkokai-yellow)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight bold
                                    :underline t))))

   `(flyspell-incorrect
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,darkokai-red)
                   :inherit unspecified))
      (,class (:foreground ,darkokai-red
                           :weight bold
                           :underline t))
      (,(append '((supports :underline (:style wave))) terminal-class)
       (:underline (:style wave :color ,terminal-darkokai-red)
                   :inherit unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :weight bold
                                    :underline t))))


   ;; git-gutter
   `(git-gutter:added
     ((,class (:background ,darkokai-green
                           :foreground ,darkokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-darkokai-green
                                    :foreground ,terminal-darkokai-bg
                                    :inherit bold))))

   `(git-gutter:deleted
     ((,class (:background ,darkokai-red
                           :foreground ,darkokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-darkokai-red
                                    :foreground ,terminal-darkokai-bg
                                    :inherit bold))))

   `(git-gutter:modified
     ((,class (:background ,darkokai-blue
                           :foreground ,darkokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-darkokai-blue
                                    :foreground ,terminal-darkokai-bg
                                    :inherit bold))))

   `(git-gutter:unchanged
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-bg
                                    :inherit bold))))

   ;; git-gutter-fr
   `(git-gutter-fr:added
     ((,class (:foreground ,darkokai-green
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :inherit bold))))

   `(git-gutter-fr:deleted
     ((,class (:foreground ,darkokai-red
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :inherit bold))))

   `(git-gutter-fr:modified
     ((,class (:foreground ,darkokai-blue
                           :inherit bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :inherit bold))))

   ;; git-gutter+ and git-gutter+-fr
   `(git-gutter+-added
     ((,class (:background ,darkokai-green
                           :foreground ,darkokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-darkokai-green
                                    :foreground ,terminal-darkokai-bg
                                    :inherit bold))))

   `(git-gutter+-deleted
     ((,class (:background ,darkokai-red
                           :foreground ,darkokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-darkokai-red
                                    :foreground ,terminal-darkokai-bg
                                    :inherit bold))))

   `(git-gutter+-modified
     ((,class (:background ,darkokai-blue
                           :foreground ,darkokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-darkokai-blue
                                    :foreground ,terminal-darkokai-bg
                                    :inherit bold))))

   `(git-gutter+-unchanged
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-bg
                           :inherit bold))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-bg
                                    :inherit bold))))

   `(git-gutter-fr+-added
     ((,class (:foreground ,darkokai-green
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :weight bold))))

   `(git-gutter-fr+-deleted
     ((,class (:foreground ,darkokai-red
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :weight bold))))

   `(git-gutter-fr+-modified
     ((,class (:foreground ,darkokai-blue
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :weight bold))))

   ;; git-timemachine
   `(git-timemachine-minibuffer-detail-face
     ((,class (:foreground ,darkokai-blue
                           :background ,darkokai-highlight-line
                           :inherit bold))
      (,terminal-class (:foreground ,darkokai-blue
                                    :background ,terminal-darkokai-highlight-line
                                    :inherit bold))))

   ;; guide-key
   `(guide-key/highlight-command-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(guide-key/key-face
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(guide-key/prefix-command-face
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   ;; gnus
   `(gnus-group-mail-1
     ((,class (:weight bold
                       :inherit gnus-group-mail-1-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-mail-1-empty))))

   `(gnus-group-mail-1-empty
     ((,class (:inherit gnus-group-news-1-empty))
      (,terminal-class (:inherit gnus-group-news-1-empty))))

   `(gnus-group-mail-2
     ((,class (:weight bold
                       :inherit gnus-group-mail-2-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-mail-2-empty))))

   `(gnus-group-mail-2-empty
     ((,class (:inherit gnus-group-news-2-empty))
      (,terminal-class (:inherit gnus-group-news-2-empty))))

   `(gnus-group-mail-3
     ((,class (:weight bold
                       :inherit gnus-group-mail-3-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-mail-3-empty))))

   `(gnus-group-mail-3-empty
     ((,class (:inherit gnus-group-news-3-empty))
      (,terminal-class (:inherit gnus-group-news-3-empty))))

   `(gnus-group-mail-low
     ((,class (:weight bold
                       :inherit gnus-group-mail-low-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-mail-low-empty))))

   `(gnus-group-mail-low-empty
     ((,class (:inherit gnus-group-news-low-empty))
      (,terminal-class (:inherit gnus-group-news-low-empty))))

   `(gnus-group-news-1
     ((,class (:weight bold
                       :inherit gnus-group-news-1-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-1-empty))))

   `(gnus-group-news-2
     ((,class (:weight bold
                       :inherit gnus-group-news-2-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-2-empty))))

   `(gnus-group-news-3
     ((,class (:weight bold
                       :inherit gnus-group-news-3-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-3-empty))))

   `(gnus-group-news-4
     ((,class (:weight bold
                       :inherit gnus-group-news-4-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-4-empty))))

   `(gnus-group-news-5
     ((,class (:weight bold
                       :inherit gnus-group-news-5-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-5-empty))))

   `(gnus-group-news-6
     ((,class (:weight bold
                       :inherit gnus-group-news-6-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-6-empty))))

   `(gnus-group-news-low
     ((,class (:weight bold
                       :inherit gnus-group-news-low-empty))
      (,terminal-class (:weight bold
                                :inherit gnus-group-news-low-empty))))

   `(gnus-header-content
     ((,class (:inherit message-header-other))
      (,terminal-class (:inherit message-header-other))))

   `(gnus-header-from
     ((,class (:inherit message-header-other))
      (,terminal-class (:inherit message-header-other))))

   `(gnus-header-name
     ((,class (:inherit message-header-name))
      (,terminal-class (:inherit message-header-name))))

   `(gnus-header-newsgroups
     ((,class (:inherit message-header-other))
      (,terminal-class (:inherit message-header-other))))

   `(gnus-header-subject
     ((,class (:inherit message-header-subject))
      (,terminal-class (:inherit message-header-subject))))

   `(gnus-summary-cancelled
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(gnus-summary-high-ancient
     ((,class (:foreground ,darkokai-blue
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :weight bold))))

   `(gnus-summary-high-read
     ((,class (:foreground ,darkokai-green
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :weight bold))))

   `(gnus-summary-high-ticked
     ((,class (:foreground ,darkokai-orange
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-orange
                                    :weight bold))))

   `(gnus-summary-high-unread
     ((,class (:foreground ,darkokai-fg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :weight bold))))

   `(gnus-summary-low-ancient
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(gnus-summary-low-read
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(gnus-summary-low-ticked
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(gnus-summary-low-unread
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(gnus-summary-normal-ancient
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(gnus-summary-normal-read
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(gnus-summary-normal-ticked
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(gnus-summary-normal-unread
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(gnus-summary-selected
     ((,class (:foreground ,darkokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight bold))))

   `(gnus-cite-1
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(gnus-cite-2
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(gnus-cite-3
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(gnus-cite-4
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(gnus-cite-5
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(gnus-cite-6
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(gnus-cite-7
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(gnus-cite-8
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(gnus-cite-9
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(gnus-cite-10
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(gnus-cite-11
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(gnus-group-news-1-empty
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(gnus-group-news-2-empty
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(gnus-group-news-3-empty
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(gnus-group-news-4-empty
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(gnus-group-news-5-empty
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(gnus-group-news-6-empty
     ((,class (:foreground ,darkokai-blue-lc))
      (,terminal-class (:foreground ,terminal-darkokai-blue-lc))))

   `(gnus-group-news-low-empty
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(gnus-signature
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(gnus-x-face
     ((,class (:background ,darkokai-fg
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-fg
                                    :foreground ,terminal-darkokai-bg))))


   ;; helm
   `(helm-apt-deinstalled
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(helm-apt-installed
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(helm-bookmark-directory
     ((,class (:inherit helm-ff-directory))
      (,terminal-class (:inherit helm-ff-directory))))

   `(helm-bookmark-file
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(helm-bookmark-gnus
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(helm-bookmark-info
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(helm-bookmark-man
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   `(helm-bookmark-w3m
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(helm-bookmarks-su
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(helm-buffer-file
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(helm-buffer-directory
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(helm-buffer-process
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(helm-buffer-saved-out
     ((,class (:foreground ,darkokai-red
                           :background ,darkokai-bg
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :background ,terminal-darkokai-bg
                                    :inverse-video t))))

   `(helm-buffer-size
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(helm-candidate-number
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-emph
                           :bold t))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-emph
                                    :bold t))))

   `(helm-ff-directory
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(helm-ff-executable
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(helm-ff-file
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-fg))))

   `(helm-ff-invalid-symlink
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-orange
                           :slant italic))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-orange
                                    :slant italic))))

   `(helm-ff-prefix
     ((,class (:background ,darkokai-green
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-green
                                    :foreground ,terminal-darkokai-bg))))

   `(helm-ff-symlink
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(helm-grep-file
     ((,class (:foreground ,darkokai-cyan
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :underline t))))

   `(helm-grep-finish
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(helm-grep-lineno
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(helm-grep-match
     ((,class (:inherit helm-match)))
     ((,terminal-class (:inherit helm-match))))

   `(helm-grep-running
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(helm-header
     ((,class (:inherit header-line))
      (,terminal-class (:inherit terminal-header-line))))

   `(helm-lisp-completion-info
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(helm-lisp-show-completion
     ((,class (:foreground ,darkokai-yellow
                           :background ,darkokai-highlight-line
                           :bold t))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :background ,terminal-darkokai-highlight-line
                                    :bold t))))

   `(helm-M-x-key
     ((,class (:foreground ,darkokai-orange
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-orange
                                    :underline t))))

   `(helm-moccur-buffer
     ((,class (:foreground ,darkokai-cyan
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :underline t))))

   `(helm-match
     ((,class (:foreground ,darkokai-green :inherit bold))
      (,terminal-class (:foreground ,terminal-darkokai-green :inherit bold))))

   `(helm-match-item
     ((,class (:inherit helm-match))
      (,terminal-class (:inherit helm-match))))

   `(helm-selection
     ((,class (:background ,darkokai-highlight-line
                           :inherit bold
                           :underline nil))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :inherit bold
                                    :underline nil))))

   `(helm-selection-line
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-emph
                           :underline nil))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-emph
                                    :underline nil))))

   `(helm-separator
     ((,class (:foreground ,darkokai-gray))
      (,terminal-class (:foreground ,terminal-darkokai-gray))))

   `(helm-source-header
     ((,class (:background ,darkokai-violet-l
                           :foreground ,darkokai-bg
                           :underline nil))
      (,terminal-class (:background ,terminal-darkokai-violet-l
                                    :foreground ,terminal-darkokai-bg
                                    :underline nil))))

   `(helm-swoop-target-line-face
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   `(helm-swoop-target-line-block-face
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   `(helm-swoop-target-word-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(helm-time-zone-current
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(helm-time-zone-home
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(helm-visible-mark
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-magenta :bold t))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-magenta :bold t))))

   ;; helm-ls-git
   `(helm-ls-git-modified-not-staged-face
     ((,class :foreground ,darkokai-blue)
      (,terminal-class :foreground ,terminal-darkokai-blue)))

   `(helm-ls-git-modified-and-staged-face
     ((,class :foreground ,darkokai-blue-l)
      (,terminal-class :foreground ,terminal-darkokai-blue-l)))

   `(helm-ls-git-renamed-modified-face
     ((,class :foreground ,darkokai-blue-l)
      (,terminal-class :foreground ,terminal-darkokai-blue-l)))

   `(helm-ls-git-untracked-face
     ((,class :foreground ,darkokai-orange)
      (,terminal-class :foreground ,terminal-darkokai-orange)))

   `(helm-ls-git-added-copied-face
     ((,class :foreground ,darkokai-green)
      (,terminal-class :foreground ,terminal-darkokai-green)))

   `(helm-ls-git-added-modified-face
     ((,class :foreground ,darkokai-green-l)
      (,terminal-class :foreground ,terminal-darkokai-green-l)))

   `(helm-ls-git-deleted-not-staged-face
     ((,class :foreground ,darkokai-red)
      (,terminal-class :foreground ,terminal-darkokai-red)))

   `(helm-ls-git-deleted-and-staged-face
     ((,class :foreground ,darkokai-red-l)
      (,terminal-class :foreground ,terminal-darkokai-red-l)))

   `(helm-ls-git-conflict-face
     ((,class :foreground ,darkokai-yellow)
      (,terminal-class :foreground ,terminal-darkokai-yellow)))

   ;; hi-lock-mode
   `(hi-yellow
     ((,class (:foreground ,darkokai-yellow-lc
                           :background ,darkokai-yellow-hc))
      (,terminal-class (:foreground ,terminal-darkokai-yellow-lc
                                    :background ,terminal-darkokai-yellow-hc))))

   `(hi-pink
     ((,class (:foreground ,darkokai-magenta-lc
                           :background ,darkokai-magenta-hc))
      (,terminal-class (:foreground ,terminal-darkokai-magenta-lc
                                    :background ,terminal-darkokai-magenta-hc))))

   `(hi-green
     ((,class (:foreground ,darkokai-green-lc
                           :background ,darkokai-green-hc))
      (,terminal-class (:foreground ,terminal-darkokai-green-lc
                                    :background ,terminal-darkokai-green-hc))))

   `(hi-blue
     ((,class (:foreground ,darkokai-blue-lc
                           :background ,darkokai-blue-hc))
      (,terminal-class (:foreground ,terminal-darkokai-blue-lc
                                    :background ,terminal-darkokai-blue-hc))))

   `(hi-black-b
     ((,class (:foreground ,darkokai-emph
                           :background ,darkokai-bg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :background ,terminal-darkokai-bg
                                    :weight bold))))

   `(hi-blue-b
     ((,class (:foreground ,darkokai-blue-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue-lc
                                    :weight bold))))

   `(hi-green-b
     ((,class (:foreground ,darkokai-green-lc
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-green-lc
                                    :weight bold))))

   `(hi-red-b
     ((,class (:foreground ,darkokai-red
                           :weight bold))))

   `(hi-black-hb
     ((,class (:foreground ,darkokai-emph
                           :background ,darkokai-bg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :background ,terminal-darkokai-bg
                                    :weight bold))))

   ;; highlight-changes
   `(highlight-changes
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(highlight-changes-delete
     ((,class (:foreground ,darkokai-red
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :underline t))))

   ;; highlight-indentation
   `(highlight-indentation-face
     ((,class (:background ,darkokai-gray))
      (,terminal-class (:background ,terminal-darkokai-gray))))

   `(highlight-indentation-current-column-face
     ((,class (:background ,darkokai-gray))
      (,terminal-class (:background ,terminal-darkokai-gray))))

   ;; hl-line-mode
   `(hl-line
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   `(hl-line-face
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   ;; ido-mode
   `(ido-first-match
     ((,class (:foreground ,darkokai-yellow
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight normal))))

   `(ido-only-match
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-yellow
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-yellow
                                    :weight normal))))

   `(ido-subdir
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(ido-incomplete-regexp
     ((,class (:foreground ,darkokai-red
                           :weight bold ))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :weight bold ))))

   `(ido-indicator
     ((,class (:background ,darkokai-red
                           :foreground ,darkokai-bg
                           :width condensed))
      (,terminal-class (:background ,terminal-darkokai-red
                                    :foreground ,terminal-darkokai-bg
                                    :width condensed))))

   `(ido-virtual
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(jabber-activity-face
     ((,class (:weight bold
                       :foreground ,darkokai-red))
      (,terminal-class (:weight bold
                                :foreground ,terminal-darkokai-red))))

   `(jabber-activity-personal-face
     ((,class (:weight bold
                       :foreground ,darkokai-blue))
      (,terminal-class (:weight bold
                                :foreground ,terminal-darkokai-blue))))

   `(jabber-chat-error
     ((,class (:weight bold
                       :foreground ,darkokai-red))
      (,terminal-class (:weight bold
                                :foreground ,terminal-darkokai-red))))

   `(jabber-chat-prompt-foreign
     ((,class (:weight bold
                       :foreground ,darkokai-red))
      (,terminal-class (:weight bold
                                :foreground ,terminal-darkokai-red))))

   `(jabber-chat-prompt-local
     ((,class (:weight bold
                       :foreground ,darkokai-blue))
      (,terminal-class (:weight bold
                                :foreground ,terminal-darkokai-blue))))

   `(jabber-chat-prompt-system
     ((,class (:weight bold
                       :foreground ,darkokai-green))
      (,terminal-class (:weight bold
                                :foreground ,terminal-darkokai-green))))

   `(jabber-chat-text-foreign
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(jabber-chat-text-local
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(jabber-chat-rare-time-face
     ((,class (:underline t
                          :foreground ,darkokai-green))
      (,terminal-class (:underline t
                                   :foreground ,terminal-darkokai-green))))

   `(jabber-roster-user-away
     ((,class (:slant italic
                      :foreground ,darkokai-green))
      (,terminal-class (:slant italic
                               :foreground ,terminal-darkokai-green))))

   `(jabber-roster-user-chatty
     ((,class (:weight bold
                       :foreground ,darkokai-orange))
      (,terminal-class (:weight bold
                                :foreground ,terminal-darkokai-orange))))

   `(jabber-roster-user-dnd
     ((,class (:slant italic
                      :foreground ,darkokai-red))
      (,terminal-class (:slant italic
                               :foreground ,terminal-darkokai-red))))

   `(jabber-roster-user-error
     ((,class (:weight light
                       :slant italic
                       :foreground ,darkokai-red))
      (,terminal-class (:weight light
                                :slant italic
                                :foreground ,terminal-darkokai-red))))

   `(jabber-roster-user-offline
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(jabber-roster-user-online
     ((,class (:weight bold
                       :foreground ,darkokai-blue))
      (,terminal-class (:weight bold
                                :foreground ,terminal-darkokai-blue))))

   `(jabber-roster-user-xa
     ((,class (:slant italic
                      :foreground ,darkokai-magenta))
      (,terminal-class (:slant italic
                               :foreground ,terminal-darkokai-magenta))))

   ;; js2-mode colors
   `(js2-error
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(js2-external-variable
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(js2-function-param
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(js2-instance-member
     ((,class (:foreground ,darkokai-magenta))
      (,terminal-class (:foreground ,terminal-darkokai-magenta))))

   `(js2-jsdoc-html-tag-delimiter
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(js2-jsdoc-html-tag-name
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(js2-object-property
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(js2-function-call
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(js2-jsdoc-tag
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(js2-jsdoc-type
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(js2-jsdoc-value
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   `(js2-magic-paren
     ((,class (:underline t))
      (,terminal-class (:underline t))))

   `(js2-private-function-call
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(js2-private-member
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(js2-warning
     ((,class (:underline ,darkokai-orange))
      (,terminal-class (:underline ,terminal-darkokai-orange))))

   ;; jedi
   `(jedi:highlight-function-argument
     ((,class (:inherit bold))
      (,terminal-class (:inherit bold))))

   ;; linum-mode
   `(linum
     ((,class (:foreground ,darkokai-highlight
                           :background ,s-fringe-bg))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :background ,terminal-s-fringe-bg))))

   ;; lusty-explorer
   `(lusty-directory-face
     ((,class (:inherit didarkokai-red-directory))
      (,terminal-class (:inherit didarkokai-red-directory))))

   `(lusty-file-face
     ((,class nil)
      (,terminal-class nil)))

   `(lusty-match-face
     ((,class (:inherit ido-first-match))
      (,terminal-class (:inherit ido-first-match))))

   `(lusty-slash-face
     ((,class (:foreground ,darkokai-cyan
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :weight bold))))

   ;; magit
   ;;
   ;; TODO: Add supports for all magit faces
   ;; https://github.com/magit/magit/search?utf8=%E2%9C%93&q=face
   ;;
   `(magit-diff-added
     ((,class (:foreground ,darkokai-green-plain
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :background ,terminal-darkokai-bg))))

   `(magit-diff-added-highlight
     ((,class (:foreground ,darkokai-green-plain
                           :background ,darkokai-highlight-line))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :background ,terminal-darkokai-highlight-line))))

   `(magit-diff-removed
     ((,class (:foreground ,darkokai-red-plain
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :background ,terminal-darkokai-bg))))

   `(magit-diff-removed-highlight
     ((,class (:foreground ,darkokai-red-plain
                           :background ,darkokai-highlight-line))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :background ,terminal-darkokai-highlight-line))))

   `(magit-section-title
     ((,class (:foreground ,darkokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight bold))))

   `(magit-branch
     ((,class (:foreground ,darkokai-orange
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-orange
                                    :weight bold))))

   `(magit-cherry-equivalent
     ((,class (:foreground ,darkokai-magenta))
      (,terminal-class (:foreground ,terminal-darkokai-magenta))))

   `(magit-cherry-unmatched
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(magit-head
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   `(magit-branch-local
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   `(magit-branch-remote
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(magit-section-heading
     ((,class (:foreground ,darkokai-yellow :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow :weight bold))))

   `(magit-process-ok
     ((,class (:foreground ,darkokai-green-plain
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :weight bold))))

   `(magit-process-ng
     ((,class (:foreground ,darkokai-red-plain
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :weight bold))))

   `(magit-item-highlight
     ((,class (:background ,darkokai-highlight-line
                           :weight unspecified))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :weight unspecified))))

   `(magit-log-author
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(magit-log-graph
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(magit-log-head-label-bisect-bad
     ((,class (:background ,darkokai-red-hc
                           :foreground ,darkokai-red-lc
                           :box 1))
      (,terminal-class (:background ,terminal-darkokai-red-hc
                                    :foreground ,terminal-darkokai-red-lc
                                    :box 1))))

   `(magit-log-head-label-bisect-good
     ((,class (:background ,darkokai-green-hc
                           :foreground ,darkokai-green-lc
                           :box 1))
      (,terminal-class (:background ,terminal-darkokai-green-hc
                                    :foreground ,terminal-darkokai-green-lc
                                    :box 1))))

   `(magit-log-head-label-default
     ((,class (:background ,darkokai-highlight-line
                           :box 1))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :box 1))))

   `(magit-log-head-label-local
     ((,class (:background ,darkokai-blue-lc
                           :foreground ,darkokai-blue-hc
                           :box 1))
      (,terminal-class (:background ,terminal-darkokai-blue-lc
                                    :foreground ,terminal-darkokai-blue-hc
                                    :box 1))))

   `(magit-log-head-label-patches
     ((,class (:background ,darkokai-red-lc
                           :foreground ,darkokai-red-hc
                           :box 1))
      (,terminal-class (:background ,terminal-darkokai-red-lc
                                    :foreground ,terminal-darkokai-red-hc
                                    :box 1))))

   `(magit-log-head-label-remote
     ((,class (:background ,darkokai-green-lc
                           :foreground ,darkokai-green-hc
                           :box 1))
      (,terminal-class (:background ,terminal-darkokai-green-lc
                                    :foreground ,terminal-darkokai-green-hc
                                    :box 1))))

   `(magit-log-head-label-tags
     ((,class (:background ,darkokai-yellow-lc
                           :foreground ,darkokai-yellow-hc
                           :box 1))
      (,terminal-class (:background ,terminal-darkokai-yellow-lc
                                    :foreground ,terminal-darkokai-yellow-hc
                                    :box 1))))

   `(magit-log-sha1
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   ;; man
   `(Man-overstrike
     ((,class (:foreground ,darkokai-blue
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :weight bold))))

   `(Man-reverse
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(Man-underline
     ((,class (:foreground ,darkokai-green :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-green :underline t))))

   ;; monky
   `(monky-section-title
     ((,class (:foreground ,darkokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight bold))))

   `(monky-diff-add
     ((,class (:foreground ,darkokai-green-plain))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(monky-diff-del
     ((,class (:foreground ,darkokai-red-plain))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   ;; markdown-mode
   `(markdown-header-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(markdown-header-face-1
     ((,class (:inherit markdown-header-face
                        :height ,darkokai-height-plus-4))
      (,terminal-class (:inherit markdown-header-face
                                 :height ,darkokai-height-plus-4))))

   `(markdown-header-face-2
     ((,class (:inherit markdown-header-face
                        :height ,darkokai-height-plus-3))
      (,terminal-class (:inherit markdown-header-face
                                 :height ,darkokai-height-plus-3))))

   `(markdown-header-face-3
     ((,class (:inherit markdown-header-face
                        :height ,darkokai-height-plus-2))
      (,terminal-class (:inherit markdown-header-face
                                 :height ,darkokai-height-plus-2))))

   `(markdown-header-face-4
     ((,class (:inherit markdown-header-face
                        :height ,darkokai-height-plus-1))
      (,terminal-class (:inherit markdown-header-face
                                 :height ,darkokai-height-plus-1))))

   `(markdown-header-face-5
     ((,class (:inherit markdown-header-face))
      (,terminal-class (:inherit markdown-header-face))))

   `(markdown-header-face-6
     ((,class (:inherit markdown-header-face))
      (,terminal-class (:inherit markdown-header-face))))

   ;; message-mode
   `(message-cited-text
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(message-header-name
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(message-header-other
     ((,class (:foreground ,darkokai-fg
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :weight normal))))

   `(message-header-to
     ((,class (:foreground ,darkokai-fg
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :weight normal))))

   `(message-header-cc
     ((,class (:foreground ,darkokai-fg
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :weight normal))))

   `(message-header-newsgroups
     ((,class (:foreground ,darkokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight bold))))

   `(message-header-subject
     ((,class (:foreground ,darkokai-cyan
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :weight normal))))

   `(message-header-xheader
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(message-mml
     ((,class (:foreground ,darkokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight bold))))

   `(message-separator
     ((,class (:foreground ,darkokai-comments
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :slant italic))))

   ;; mew
   `(mew-face-header-subject
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(mew-face-header-from
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(mew-face-header-date
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(mew-face-header-to
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(mew-face-header-key
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(mew-face-header-private
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(mew-face-header-important
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(mew-face-header-marginal
     ((,class (:foreground ,darkokai-fg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :weight bold))))

   `(mew-face-header-warning
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(mew-face-header-xmew
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(mew-face-header-xmew-bad
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(mew-face-body-url
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(mew-face-body-comment
     ((,class (:foreground ,darkokai-fg
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :slant italic))))

   `(mew-face-body-cite1
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(mew-face-body-cite2
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(mew-face-body-cite3
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(mew-face-body-cite4
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(mew-face-body-cite5
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(mew-face-mark-review
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(mew-face-mark-escape
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(mew-face-mark-delete
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(mew-face-mark-unlink
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(mew-face-mark-refile
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(mew-face-mark-unread
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(mew-face-eof-message
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(mew-face-eof-part
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   ;; mingus
   `(mingus-directory-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(mingus-pausing-face
     ((,class (:foreground ,darkokai-magenta))
      (,terminal-class (:foreground ,terminal-darkokai-magenta))))

   `(mingus-playing-face
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(mingus-playlist-face
     ((,class (:foreground ,darkokai-cyan ))
      (,terminal-class (:foreground ,terminal-darkokai-cyan ))))

   `(mingus-song-file-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(mingus-stopped-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   ;; mmm
   `(mmm-init-submode-face
     ((,class (:background ,darkokai-violet-d))
      (,terminal-class (:background ,terminal-darkokai-violet-d))))

   `(mmm-cleanup-submode-face
     ((,class (:background ,darkokai-orange-d))
      (,terminal-class (:background ,terminal-darkokai-orange-d))))

   `(mmm-declaration-submode-face
     ((,class (:background ,darkokai-cyan-d))
      (,terminal-class (:background ,terminal-darkokai-cyan-d))))

   `(mmm-comment-submode-face
     ((,class (:background ,darkokai-blue-d))
      (,terminal-class (:background ,terminal-darkokai-blue-d))))

   `(mmm-output-submode-face
     ((,class (:background ,darkokai-red-d))
      (,terminal-class (:background ,terminal-darkokai-red-d))))

   `(mmm-special-submode-face
     ((,class (:background ,darkokai-green-d))
      (,terminal-class (:background ,terminal-darkokai-green-d))))

   `(mmm-code-submode-face
     ((,class (:background ,darkokai-gray))
      (,terminal-class (:background ,terminal-darkokai-gray))))

   `(mmm-default-submode-face
     ((,class (:background ,darkokai-gray-d))
      (,terminal-class (:background ,terminal-darkokai-gray-d))))

   ;; moccur
   `(moccur-current-line-face
     ((,class (:underline t))
      (,terminal-class (:underline t))))

   `(moccur-edit-done-face
     ((,class (:foreground ,darkokai-comments
                           :background ,darkokai-bg
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :background ,terminal-darkokai-bg
                                    :slant italic))))

   `(moccur-edit-face
     ((,class (:background ,darkokai-yellow
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-yellow
                                    :foreground ,terminal-darkokai-bg))))

   `(moccur-edit-file-face
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   `(moccur-edit-reject-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(moccur-face
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-emph
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-emph
                                    :weight bold))))

   `(search-buffers-face
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-emph
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-emph
                                    :weight bold))))

   `(search-buffers-header-face
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-yellow
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-yellow
                                    :weight bold))))

   ;; mu4e
   `(mu4e-cited-1-face
     ((,class (:foreground ,darkokai-green
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :slant italic
                                    :weight normal))))

   `(mu4e-cited-2-face
     ((,class (:foreground ,darkokai-blue
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :slant italic
                                    :weight normal))))

   `(mu4e-cited-3-face
     ((,class (:foreground ,darkokai-orange
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-orange
                                    :slant italic
                                    :weight normal))))

   `(mu4e-cited-4-face
     ((,class (:foreground ,darkokai-yellow
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :slant italic
                                    :weight normal))))

   `(mu4e-cited-5-face
     ((,class (:foreground ,darkokai-cyan
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :slant italic
                                    :weight normal))))

   `(mu4e-cited-6-face
     ((,class (:foreground ,darkokai-green
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :slant italic
                                    :weight normal))))

   `(mu4e-cited-7-face
     ((,class (:foreground ,darkokai-blue
                           :slant italic
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :slant italic
                                    :weight normal))))

   `(mu4e-flagged-face
     ((,class (:foreground ,darkokai-magenta
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-magenta
                                    :weight bold))))

   `(mu4e-view-url-number-face
     ((,class (:foreground ,darkokai-yellow
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight normal))))

   `(mu4e-warning-face
     ((,class (:foreground ,darkokai-red
                           :slant normal
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :slant normal
                                    :weight bold))))

   `(mu4e-header-highlight-face
     ((,class (:inherit unspecified
                        :foreground unspecified
                        :background ,darkokai-highlight-line
                        :underline ,darkokai-emph
                        :weight normal))
      (,terminal-class (:inherit unspecified
                                 :foreground unspecified
                                 :background ,terminal-darkokai-highlight-line
                                 :underline ,terminal-darkokai-emph
                                 :weight normal))))


   `(mu4e-draft-face
     ((,class (:inherit font-lock-string-face))
      (,terminal-class (:inherit font-lock-string-face))))

   `(mu4e-footer-face
     ((,class (:inherit font-lock-comment-face))
      (,terminal-class (:inherit font-lock-comment-face))))

   `(mu4e-forwarded-face
     ((,class (:inherit font-lock-builtin-face
                        :weight normal))
      (,terminal-class (:inherit font-lock-builtin-face
                                 :weight normal))))

   `(mu4e-header-face
     ((,class (:inherit default))
      (,terminal-class (:inherit default))))

   `(mu4e-header-marks-face
     ((,class (:inherit font-lock-preprocessor-face))
      (,terminal-class (:inherit font-lock-preprocessor-face))))

   `(mu4e-header-title-face
     ((,class (:inherit font-lock-type-face))
      (,terminal-class (:inherit font-lock-type-face))))

   `(mu4e-highlight-face
     ((,class (:inherit font-lock-pseudo-keyword-face
                        :weight bold))
      (,terminal-class (:inherit font-lock-pseudo-keyword-face
                                 :weight bold))))

   `(mu4e-moved-face
     ((,class (:inherit font-lock-comment-face
                        :slant italic))
      (,terminal-class (:inherit font-lock-comment-face
                                 :slant italic))))

   `(mu4e-ok-face
     ((,class (:inherit font-lock-comment-face
                        :slant normal
                        :weight bold))
      (,terminal-class (:inherit font-lock-comment-face
                                 :slant normal
                                 :weight bold))))

   `(mu4e-replied-face
     ((,class (:inherit font-lock-builtin-face
                        :weight normal))
      (,terminal-class (:inherit font-lock-builtin-face
                                 :weight normal))))

   `(mu4e-system-face
     ((,class (:inherit font-lock-comment-face
                        :slant italic))
      (,terminal-class (:inherit font-lock-comment-face
                                 :slant italic))))

   `(mu4e-title-face
     ((,class (:inherit font-lock-type-face
                        :weight bold))
      (,terminal-class (:inherit font-lock-type-face
                                 :weight bold))))

   `(mu4e-trashed-face
     ((,class (:inherit font-lock-comment-face
                        :strike-through t))
      (,terminal-class (:inherit font-lock-comment-face
                                 :strike-through t))))

   `(mu4e-unread-face
     ((,class (:inherit font-lock-keyword-face
                        :weight bold))
      (,terminal-class (:inherit font-lock-keyword-face
                                 :weight bold))))

   `(mu4e-view-attach-number-face
     ((,class (:inherit font-lock-variable-name-face
                        :weight bold))
      (,terminal-class (:inherit font-lock-variable-name-face
                                 :weight bold))))

   `(mu4e-view-contact-face
     ((,class (:foreground ,darkokai-fg
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :weight normal))))

   `(mu4e-view-header-key-face
     ((,class (:inherit message-header-name
                        :weight normal))
      (,terminal-class (:inherit message-header-name
                                 :weight normal))))

   `(mu4e-view-header-value-face
     ((,class (:foreground ,darkokai-cyan
                           :weight normal
                           :slant normal))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :weight normal
                                    :slant normal))))

   `(mu4e-view-link-face
     ((,class (:inherit link))
      (,terminal-class (:inherit link))))

   `(mu4e-view-special-header-value-face
     ((,class (:foreground ,darkokai-blue
                           :weight normal
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :weight normal
                                    :underline nil))))

   ;; mumamo
   `(mumamo-background-chunk-submode1
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   ;; nav
   `(nav-face-heading
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(nav-face-button-num
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(nav-face-dir
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(nav-face-hdir
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(nav-face-file
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(nav-face-hfile
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   ;; nav-flash
   `(nav-flash-face
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   ;; neo-tree
   `(neo-banner-face
     ((,class (:foreground ,darkokai-blue
                           :background ,darkokai-bg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :background ,terminal-darkokai-bg
                                    :weight bold))))


   `(neo-header-face
     ((,class (:foreground ,darkokai-emph
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :background ,terminal-darkokai-bg))))

   `(neo-root-dir-face
     ((,class (:foreground ,darkokai-green
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :background ,terminal-darkokai-bg))))

   `(neo-dir-link-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :background ,terminal-darkokai-bg))))

   `(neo-file-link-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(neo-button-face
     ((,class (:underline nil))
      (,terminal-class (:underline nil))))

   `(neo-expand-btn-face
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(neo-vc-default-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(neo-vc-user-face
     ((,class (:foreground ,darkokai-red
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :slant italic))))

   `(neo-vc-up-to-date-face
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(neo-vc-edited-face
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(neo-vc-needs-update-face
     ((,class (:underline t))
      (,terminal-class (:underline t))))

   `(neo-vc-needs-merge-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(neo-vc-unlocked-changes-face
     ((,class (:foreground ,darkokai-red
                           :background ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :background ,terminal-darkokai-comments))))

   `(neo-vc-added-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(neo-vc-removed-face
     ((,class (:strike-through t))
      (,terminal-class (:strike-through t))))

   `(neo-vc-conflict-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(neo-vc-missing-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(neo-vc-ignored-face
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))


   ;; org-mode
   `(org-agenda-structure
     ((,class (:foreground ,darkokai-emph
                           :background ,darkokai-highlight-line
                           :weight bold
                           :slant normal
                           :inverse-video nil
                           :height ,darkokai-height-plus-1
                           :underline nil
                           :box (:line-width 2 :color ,darkokai-bg)))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :background ,terminal-darkokai-highlight-line
                                    :weight bold
                                    :slant normal
                                    :inverse-video nil
                                    :height ,darkokai-height-plus-1
                                    :underline nil
                                    :box (:line-width 2 :color ,terminal-darkokai-bg)))))

   `(org-agenda-calendar-event
     ((,class (:foreground ,darkokai-emph))
      (,terminal-class (:foreground ,terminal-darkokai-emph))))

   `(org-agenda-calendar-sexp
     ((,class (:foreground ,darkokai-fg
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :slant italic))))

   `(org-agenda-date
     ((,class (:foreground ,darkokai-comments
                           :background ,darkokai-bg
                           :weight normal
                           :inverse-video nil
                           :overline nil
                           :slant normal
                           :height 1.0
                           :box (:line-width 2 :color ,darkokai-bg)))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :background ,terminal-darkokai-bg
                                    :weight normal
                                    :inverse-video nil
                                    :overline nil
                                    :slant normal
                                    :height 1.0
                                    :box (:line-width 2 :color ,terminal-darkokai-bg)))) t)

   `(org-agenda-date-weekend
     ((,class (:inherit org-agenda-date
                        :inverse-video nil
                        :background unspecified
                        :foreground ,darkokai-comments
                        :weight unspecified
                        :underline t
                        :overline nil
                        :box unspecified))
      (,terminal-class (:inherit org-agenda-date
                                 :inverse-video nil
                                 :background unspecified
                                 :foreground ,terminal-darkokai-comments
                                 :weight unspecified
                                 :underline t
                                 :overline nil
                                 :box unspecified))) t)

   `(org-agenda-date-today
     ((,class (:inherit org-agenda-date
                        :inverse-video t
                        :weight bold
                        :underline unspecified
                        :overline nil
                        :box unspecified
                        :foreground ,darkokai-blue
                        :background ,darkokai-bg))
      (,terminal-class (:inherit org-agenda-date
                                 :inverse-video t
                                 :weight bold
                                 :underline unspecified
                                 :overline nil
                                 :box unspecified
                                 :foreground ,terminal-darkokai-blue
                                 :background ,terminal-darkokai-bg))) t)

   `(org-agenda-done
     ((,class (:foreground ,darkokai-comments
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :slant italic))) t)

   `(org-archived
     ((,class (:foreground ,darkokai-comments
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :weight normal))))

   `(org-block
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(org-block-begin-line
     ((,class (:foreground ,darkokai-comments
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :slant italic))))

   `(org-checkbox
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-fg
                           :box (:line-width 1 :style released-button)))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-fg
                                    :box (:line-width 1 :style released-button)))))

   `(org-code
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(org-date
     ((,class (:foreground ,darkokai-blue
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :underline t))))

   `(org-done
     ((,class (:weight bold
                       :foreground ,darkokai-green))
      (,terminal-class (:weight bold
                                :foreground ,terminal-darkokai-green))))

   `(org-ellipsis
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(org-formula
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(org-headline-done
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(org-hide
     ((,class (:foreground ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-bg))))

   `(org-level-1
     ((,class (:inherit ,s-variable-pitch
                        :height ,darkokai-height-plus-4
                        :foreground ,darkokai-orange))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :height ,darkokai-height-plus-4
                                 :foreground ,terminal-darkokai-orange))))

   `(org-level-2
     ((,class (:inherit ,s-variable-pitch
                        :height ,darkokai-height-plus-3
                        :foreground ,darkokai-green))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :height ,darkokai-height-plus-3
                                 :foreground ,terminal-darkokai-green))))

   `(org-level-3
     ((,class (:inherit ,s-variable-pitch
                        :height ,darkokai-height-plus-2
                        :foreground ,darkokai-blue))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :height ,darkokai-height-plus-2
                                 :foreground ,terminal-darkokai-blue))))

   `(org-level-4
     ((,class (:inherit ,s-variable-pitch
                        :height ,darkokai-height-plus-1
                        :foreground ,darkokai-yellow))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :height ,darkokai-height-plus-1
                                 :foreground ,terminal-darkokai-yellow))))

   `(org-level-5
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-cyan))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-cyan))))

   `(org-level-6
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-green))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-green))))

   `(org-level-7
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-red))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-red))))

   `(org-level-8
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-blue))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-blue))))

   `(org-link
     ((,class (:foreground ,darkokai-yellow
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :underline t))))

   `(org-sexp-date
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   `(org-scheduled
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(org-scheduled-previously
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(org-scheduled-today
     ((,class (:foreground ,darkokai-blue
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :weight normal))))

   `(org-special-keyword
     ((,class (:foreground ,darkokai-comments
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :weight bold))))

   `(org-table
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(org-tag
     ((,class (:weight bold))
      (,terminal-class (:weight bold))))

   `(org-time-grid
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(org-todo
     ((,class (:foreground ,darkokai-red
                           :weight bold)))
     ((,terminal-class (:foreground ,terminal-darkokai-red
                                    :weight bold))))

   `(org-upcoming-deadline
     ((,class (:foreground ,darkokai-yellow
                           :weight normal
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight normal
                                    :underline nil))))

   `(org-warning
     ((,class (:foreground ,darkokai-orange
                           :weight normal
                           :underline nil))
      (,terminal-class (:foreground ,terminal-darkokai-orange
                                    :weight normal
                                    :underline nil))))

   ;; org-habit (clear=blue, ready=green, alert=yellow, overdue=red. future=lower contrast)
   `(org-habit-clear-face
     ((,class (:background ,darkokai-blue-lc
                           :foreground ,darkokai-blue-hc))
      (,terminal-class (:background ,terminal-darkokai-blue-lc
                                    :foreground ,terminal-darkokai-blue-hc))))

   `(org-habit-clear-future-face
     ((,class (:background ,darkokai-blue-lc))
      (,terminal-class (:background ,terminal-darkokai-blue-lc))))

   `(org-habit-ready-face
     ((,class (:background ,darkokai-green-lc
                           :foreground ,darkokai-green))
      (,terminal-class (:background ,terminal-darkokai-green-lc
                                    :foreground ,terminal-darkokai-green))))

   `(org-habit-ready-future-face
     ((,class (:background ,darkokai-green-lc))
      (,terminal-class (:background ,terminal-darkokai-green-lc))))

   `(org-habit-alert-face
     ((,class (:background ,darkokai-yellow
                           :foreground ,darkokai-yellow-lc))
      (,terminal-class (:background ,terminal-darkokai-yellow
                                    :foreground ,terminal-darkokai-yellow-lc))))

   `(org-habit-alert-future-face
     ((,class (:background ,darkokai-yellow-lc))
      (,terminal-class (:background ,terminal-darkokai-yellow-lc))))

   `(org-habit-overdue-face
     ((,class (:background ,darkokai-red
                           :foreground ,darkokai-red-lc))
      (,terminal-class (:background ,terminal-darkokai-red
                                    :foreground ,terminal-darkokai-red-lc))))

   `(org-habit-overdue-future-face
     ((,class (:background ,darkokai-red-lc))
      (,terminal-class (:background ,terminal-darkokai-red-lc))))

   ;; latest additions
   `(org-agenda-dimmed-todo-face
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(org-agenda-restriction-lock
     ((,class (:background ,darkokai-yellow))
      (,terminal-class (:background ,terminal-darkokai-yellow))))

   `(org-clock-overlay
     ((,class (:background ,darkokai-yellow))
      (,terminal-class (:background ,terminal-darkokai-yellow))))

   `(org-column
     ((,class (:background ,darkokai-highlight-line
                           :strike-through nil
                           :underline nil
                           :slant normal
                           :weight normal
                           :inherit default))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :strike-through nil
                                    :underline nil
                                    :slant normal
                                    :weight normal
                                    :inherit default))))

   `(org-column-title
     ((,class (:background ,darkokai-highlight-line
                           :underline t
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :underline t
                                    :weight bold))))

   `(org-date-selected
     ((,class (:foreground ,darkokai-red
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :inverse-video t))))

   `(org-document-info
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(org-document-title
     ((,class (:foreground ,darkokai-emph
                           :weight bold
                           :height ,darkokai-height-plus-4))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :weight bold
                                    :height ,darkokai-height-plus-4))))

   `(org-drawer
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(org-footnote
     ((,class (:foreground ,darkokai-magenta
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-magenta
                                    :underline t))))

   `(org-latex-and-export-specials
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(org-mode-line-clock-overrun
     ((,class (:inherit mode-line))
      (,terminal-class (:inherit mode-line))))

   ;; outline
   `(outline-1
     ((,class (:inherit org-level-1))
      (,terminal-class (:inherit org-level-1))))

   `(outline-2
     ((,class (:inherit org-level-2))
      (,terminal-class (:inherit org-level-2))))

   `(outline-3
     ((,class (:inherit org-level-3))
      (,terminal-class (:inherit org-level-3))))

   `(outline-4
     ((,class (:inherit org-level-4))
      (,terminal-class (:inherit org-level-4))))

   `(outline-5
     ((,class (:inherit org-level-5))
      (,terminal-class (:inherit org-level-5))))

   `(outline-6
     ((,class (:inherit org-level-6))
      (,terminal-class (:inherit org-level-6))))

   `(outline-7
     ((,class (:inherit org-level-7))
      (,terminal-class (:inherit org-level-7))))

   `(outline-8
     ((,class (:inherit org-level-8))
      (,terminal-class (:inherit org-level-8))))

   ;; parenface
   `(paren-face
     ((,terminal-class (:foreground ,darkokai-comments))))

   ;; perspective
   `(persp-selected-face
     ((,class (:foreground ,darkokai-violet
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-violet
                                    :weight bold))))

   ;; pretty-mode
   `(pretty-mode-symbol-face
     ((,class (:foreground ,darkokai-yellow
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight normal))))

   ;; popup
   `(popup-face
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-fg))))

   `(popup-isearch-match
     ((,class (:background ,darkokai-green))
      (,terminal-class (:background ,terminal-darkokai-green))))

   `(popup-menu-face
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-fg))))

   `(popup-menu-mouse-face
     ((,class (:background ,darkokai-blue
                           :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-blue
                                    :foreground ,terminal-darkokai-fg))))

   `(popup-menu-selection-face
     ((,class (:background ,darkokai-magenta
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-magenta
                                    :foreground ,terminal-darkokai-bg))))

   `(popup-scroll-bar-background-face
     ((,class (:background ,darkokai-comments))
      (,terminal-class (:background ,terminal-darkokai-comments))))

   `(popup-scroll-bar-foreground-face
     ((,class (:background ,darkokai-emph))
      (,terminal-class (:background ,terminal-darkokai-emph))))

   `(popup-tip-face
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-fg))))

   ;; powerline
   `(powerline-active1
     ((,class (:background ,s-powerline-active1-bg :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-gray :foreground ,darkokai-fg))))

   `(powerline-active2
     ((,class (:background ,s-powerline-active2-bg :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-gray-l :foreground ,darkokai-fg))))

   `(powerline-inactive1
     ((,class (:background ,s-powerline-inactive1-bg))
      (,terminal-class (:background ,terminal-darkokai-gray-d))))

   `(powerline-inactive2
     ((,class (:background ,s-powerline-inactive2-bg))
      (,terminal-class (:background ,terminal-darkokai-gray))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   `(rainbow-delimiters-depth-2-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(rainbow-delimiters-depth-3-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(rainbow-delimiters-depth-4-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(rainbow-delimiters-depth-5-face
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(rainbow-delimiters-depth-6-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(rainbow-delimiters-depth-7-face
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   `(rainbow-delimiters-depth-8-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(rainbow-delimiters-depth-9-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(rainbow-delimiters-depth-10-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(rainbow-delimiters-depth-11-face
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(rainbow-delimiters-depth-12-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(rainbow-delimiters-unmatched-face
     ((,class (:foreground ,darkokai-fg
                           :background ,darkokai-bg
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :background ,terminal-darkokai-bg
                                    :inverse-video t))))

   ;; rhtm-mode
   `(erb-face
     ((,class (:foreground ,darkokai-emph
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :background ,terminal-darkokai-bg))))

   `(erb-delim-face
     ((,class (:foreground ,darkokai-cyan
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :background ,terminal-darkokai-bg))))

   `(erb-exec-face
     ((,class (:foreground ,darkokai-emph
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :background ,terminal-darkokai-bg))))

   `(erb-exec-delim-face
     ((,class (:foreground ,darkokai-cyan
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :background ,terminal-darkokai-bg))))

   `(erb-out-face
     ((,class (:foreground ,darkokai-emph
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :background ,terminal-darkokai-bg))))

   `(erb-out-delim-face
     ((,class (:foreground ,darkokai-cyan
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :background ,terminal-darkokai-bg))))

   `(erb-comment-face
     ((,class (:foreground ,darkokai-emph
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :background ,terminal-darkokai-bg))))

   `(erb-comment-delim-face
     ((,class (:foreground ,darkokai-cyan
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :background ,terminal-darkokai-bg))))

   ;; rst-mode
   `(rst-level-1-face
     ((,class (:background ,darkokai-yellow
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-yellow
                                    :foreground ,terminal-darkokai-bg))))

   `(rst-level-2-face
     ((,class (:background ,darkokai-cyan
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-cyan
                                    :foreground ,terminal-darkokai-bg))))

   `(rst-level-3-face
     ((,class (:background ,darkokai-blue
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-blue
                                    :foreground ,terminal-darkokai-bg))))

   `(rst-level-4-face
     ((,class (:background ,darkokai-violet
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-violet
                                    :foreground ,terminal-darkokai-bg))))

   `(rst-level-5-face
     ((,class (:background ,darkokai-magenta
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-magenta
                                    :foreground ,terminal-darkokai-bg))))

   `(rst-level-6-face
     ((,class (:background ,darkokai-red
                           :foreground ,darkokai-bg))
      (,terminal-class (:background ,terminal-darkokai-red
                                    :foreground ,terminal-darkokai-bg))))

   ;; rpm-mode
   `(rpm-spec-dir-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(rpm-spec-doc-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(rpm-spec-ghost-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(rpm-spec-macro-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(rpm-spec-obsolete-tag-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(rpm-spec-package-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(rpm-spec-section-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(rpm-spec-tag-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(rpm-spec-var-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   ;; sh-mode
   `(sh-quoted-exec
     ((,class (:foreground ,darkokai-violet
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-violet
                                    :weight bold))))

   `(sh-escaped-newline
     ((,class (:foreground ,darkokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight bold))))

   `(sh-heredoc
     ((,class (:foreground ,darkokai-yellow
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight bold))))

   ;; smartparens
   `(sp-pair-overlay-face
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   `(sp-wrap-overlay-face
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   `(sp-wrap-tag-overlay-face
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   `(sp-show-pair-enclosing
     ((,class (:inherit highlight))
      (,terminal-class (:inherit highlight))))

   `(sp-show-pair-match-face
     ((,class (:background ,darkokai-cyan-l
                           :foreground ,darkokai-cyan-d
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :background ,terminal-darkokai-bg
                                    :weight normal
                                    :inverse-video t))))

   `(sp-show-pair-mismatch-face
     ((,class (:foreground ,darkokai-red
                           :background ,darkokai-bg
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :background ,terminal-darkokai-bg
                                    :weight normal
                                    :inverse-video t))))

   ;; show-paren
   `(show-paren-match
     ((,class (:foreground ,darkokai-cyan-d
                           :background ,darkokai-cyan-l
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-cyan-d
                                    :background ,terminal-darkokai-cyan-l
                                    :weight normal
                                    :inverse-video t))))

   `(show-paren-mismatch
     ((,class (:foreground ,darkokai-red
                           :background ,darkokai-bg
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :background ,terminal-darkokai-bg
                                    :weight normal
                                    :inverse-video t))))

   ;; mic-paren
   `(paren-face-match
     ((,class (:foreground ,darkokai-green
                           :background ,darkokai-bg
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :background ,terminal-darkokai-bg
                                    :weight normal
                                    :inverse-video t))))

   `(paren-face-mismatch
     ((,class (:foreground ,darkokai-red
                           :background ,darkokai-bg
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :background ,terminal-darkokai-bg
                                    :weight normal
                                    :inverse-video t))))

   `(paren-face-no-match
     ((,class (:foreground ,darkokai-red
                           :background ,darkokai-bg
                           :weight normal
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :background ,terminal-darkokai-bg
                                    :weight normal
                                    :inverse-video t))))

   ;; SLIME
   `(slime-repl-inputed-output-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   ;; speedbar
   `(speedbar-button-face
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-comments))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-comments))))

   `(speedbar-directory-face
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-blue))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-blue))))

   `(speedbar-file-face
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-fg))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-fg))))

   `(speedbar-highlight-face
     ((,class (:inherit ,s-variable-pitch
                        :background ,darkokai-highlight-line))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :background ,terminal-darkokai-highlight-line))))

   `(speedbar-selected-face
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-yellow
                        :underline t))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-yellow
                                 :underline t))))

   `(speedbar-separator-face
     ((,class (:inherit ,s-variable-pitch
                        :background ,darkokai-blue
                        :foreground ,darkokai-bg
                        :overline ,darkokai-cyan-lc))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :background ,terminal-darkokai-blue
                                 :foreground ,terminal-darkokai-bg
                                 :overline ,terminal-darkokai-cyan-lc))))

   `(speedbar-tag-face
     ((,class (:inherit ,s-variable-pitch
                        :foreground ,darkokai-green))
      (,terminal-class (:inherit ,terminal-s-variable-pitch
                                 :foreground ,terminal-darkokai-green))))

   ;; sunrise commander headings
   `(sr-active-path-face
     ((,class (:background ,darkokai-blue
                           :foreground ,darkokai-bg
                           :height ,darkokai-height-plus-1
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-blue
                                    :foreground ,terminal-darkokai-bg
                                    :height ,darkokai-height-plus-1
                                    :weight bold))))

   `(sr-editing-path-face
     ((,class (:background ,darkokai-yellow
                           :foreground ,darkokai-bg
                           :weight bold
                           :height ,darkokai-height-plus-1))
      (,terminal-class (:background ,terminal-darkokai-yellow
                                    :foreground ,terminal-darkokai-bg
                                    :weight bold
                                    :height ,darkokai-height-plus-1))))

   `(sr-highlight-path-face
     ((,class (:background ,darkokai-green
                           :foreground ,darkokai-bg
                           :weight bold
                           :height ,darkokai-height-plus-1))
      (,terminal-class (:background ,terminal-darkokai-green
                                    :foreground ,terminal-darkokai-bg
                                    :weight bold
                                    :height ,darkokai-height-plus-1))))

   `(sr-passive-path-face
     ((,class (:background ,darkokai-comments
                           :foreground ,darkokai-bg
                           :weight bold
                           :height ,darkokai-height-plus-1))
      (,terminal-class (:background ,terminal-darkokai-comments
                                    :foreground ,terminal-darkokai-bg
                                    :weight bold
                                    :height ,darkokai-height-plus-1))))

   ;; sunrise commander marked
   `(sr-marked-dir-face
     ((,class (:inherit didarkokai-red-marked))
      (,terminal-class (:inherit didarkokai-red-marked))))

   `(sr-marked-file-face
     ((,class (:inherit didarkokai-red-marked))
      (,terminal-class (:inherit didarkokai-red-marked))))

   `(sr-alt-marked-dir-face
     ((,class (:background ,darkokai-magenta
                           :foreground ,darkokai-bg
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-magenta
                                    :foreground ,terminal-darkokai-bg
                                    :weight bold))))

   `(sr-alt-marked-file-face
     ((,class (:background ,darkokai-magenta
                           :foreground ,darkokai-bg
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-magenta
                                    :foreground ,terminal-darkokai-bg
                                    :weight bold))))

   ;; sunrise commander fstat
   `(sr-directory-face
     ((,class (:inherit didarkokai-red-directory
                        :weight normal))
      (,terminal-class (:inherit didarkokai-red-directory
                                 :weight normal))))

   `(sr-symlink-directory-face
     ((,class (:inherit didarkokai-red-directory
                        :slant italic
                        :weight normal))
      (,terminal-class (:inherit didarkokai-red-directory
                                 :slant italic
                                 :weight normal))))

   `(sr-symlink-face
     ((,class (:inherit didarkokai-red-symlink
                        :slant italic
                        :weight normal))
      (,terminal-class (:inherit didarkokai-red-symlink
                                 :slant italic
                                 :weight normal))))

   `(sr-broken-link-face
     ((,class (:inherit didarkokai-red-warning
                        :slant italic
                        :weight normal))
      (,terminal-class (:inherit didarkokai-red-warning
                                 :slant italic
                                 :weight normal))))

   ;; sunrise commander file types
   `(sr-compressed-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(sr-encrypted-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(sr-log-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(sr-packaged-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(sr-html-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(sr-xml-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   ;; sunrise commander misc
   `(sr-clex-hotchar-face
     ((,class (:background ,darkokai-red
                           :foreground ,darkokai-bg
                           :weight bold))
      (,terminal-class (:background ,terminal-darkokai-red
                                    :foreground ,terminal-darkokai-bg
                                    :weight bold))))

   ;; syslog-mode
   `(syslog-ip-face
     ((,class (:background unspecified
                           :foreground ,darkokai-yellow))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-yellow))))

   `(syslog-hour-face
     ((,class (:background unspecified
                           :foreground ,darkokai-green))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-green))))

   `(syslog-error-face
     ((,class (:background unspecified
                           :foreground ,darkokai-red
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-red
                                    :weight bold))))

   `(syslog-warn-face
     ((,class (:background unspecified
                           :foreground ,darkokai-orange
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-orange
                                    :weight bold))))

   `(syslog-info-face
     ((,class (:background unspecified
                           :foreground ,darkokai-blue
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-blue
                                    :weight bold))))

   `(syslog-debug-face
     ((,class (:background unspecified
                           :foreground ,darkokai-cyan
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-cyan
                                    :weight bold))))

   `(syslog-su-face
     ((,class (:background unspecified
                           :foreground ,darkokai-magenta))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-magenta))))

   ;; table
   `(table-cell
     ((,class (:foreground ,darkokai-fg
                           :background ,darkokai-highlight-line))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :background ,terminal-darkokai-highlight-line))))

   ;; term
   `(term-color-black
     ((,class (:foreground ,darkokai-bg
                           :background ,darkokai-highlight-line))
      (,terminal-class (:foreground ,terminal-darkokai-bg
                                    :background ,terminal-darkokai-highlight-line))))

   `(term-color-red
     ((,class (:foreground ,darkokai-red
                           :background ,darkokai-red-d))
      (,terminal-class (:foreground ,terminal-darkokai-red
                                    :background ,terminal-darkokai-red-d))))

   `(term-color-green
     ((,class (:foreground ,darkokai-green
                           :background ,darkokai-green-d))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :background ,terminal-darkokai-green-d))))

   `(term-color-yellow
     ((,class (:foreground ,darkokai-yellow
                           :background ,darkokai-yellow-d))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :background ,terminal-darkokai-yellow-d))))

   `(term-color-blue
     ((,class (:foreground ,darkokai-blue
                           :background ,darkokai-blue-d))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :background ,terminal-darkokai-blue-d))))

   `(term-color-magenta
     ((,class (:foreground ,darkokai-magenta
                           :background ,darkokai-magenta-d))
      (,terminal-class (:foreground ,terminal-darkokai-magenta
                                    :background ,terminal-darkokai-magenta-d))))

   `(term-color-cyan
     ((,class (:foreground ,darkokai-cyan
                           :background ,darkokai-cyan-d))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :background ,terminal-darkokai-cyan-d))))

   `(term-color-white
     ((,class (:foreground ,darkokai-emph
                           :background ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :background ,terminal-darkokai-fg))))

   `(term-default-fg-color
     ((,class (:inherit term-color-white))
      (,terminal-class (:inherit term-color-white))))

   `(term-default-bg-color
     ((,class (:inherit term-color-black))
      (,terminal-class (:inherit term-color-black))))

   ;; tooltip. (NOTE: This setting has no effect on the os widgets for me
   ;; zencoding uses this)
   `(tooltip
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-yellow
                           :inherit ,s-variable-pitch))))

   ;; tuareg
   `(tuareg-font-lock-governing-face
     ((,class (:foreground ,darkokai-magenta
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-magenta
                                    :weight bold))))

   `(tuareg-font-lock-multistage-face
     ((,class (:foreground ,darkokai-blue
                           :background ,darkokai-highlight-line
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :background ,terminal-darkokai-highlight-line
                                    :weight bold))))

   `(tuareg-font-lock-operator-face
     ((,class (:foreground ,darkokai-emph))
      (,terminal-class (:foreground ,terminal-darkokai-emph))))

   `(tuareg-font-lock-error-face
     ((,class (:foreground ,darkokai-yellow
                           :background ,darkokai-red
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :background ,terminal-darkokai-red
                                    :weight bold))))

   `(tuareg-font-lock-interactive-output-face
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(tuareg-font-lock-interactive-error-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   ;; undo-tree
   `(undo-tree-visualizer-default-face
     ((,class (:foreground ,darkokai-comments
                           :background ,darkokai-bg))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :background ,terminal-darkokai-bg))))

   `(undo-tree-visualizer-unmodified-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(undo-tree-visualizer-current-face
     ((,class (:foreground ,darkokai-blue
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :inverse-video t))))

   `(undo-tree-visualizer-active-branch-face
     ((,class (:foreground ,darkokai-emph
                           :background ,darkokai-bg
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :background ,terminal-darkokai-bg
                                    :weight bold))))

   `(undo-tree-visualizer-register-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   ;; volatile highlights
   `(vhl/default-face
     ((,class (:background ,darkokai-green-lc
                           :foreground ,darkokai-green-hc))
      (,terminal-class (:background ,terminal-darkokai-green-lc
                                    :foreground ,terminal-darkokai-green-hc))))

   ;; w3m
   `(w3m-anchor
     ((,class (:inherit link))
      (,terminal-class (:inherit link))))

   `(w3m-arrived-anchor
     ((,class (:inherit link-visited))
      (,terminal-class (:inherit link-visited))))

   `(w3m-form
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-fg))))

   `(w3m-header-line-location-title
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-yellow))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-yellow))))

   `(w3m-header-line-location-content

     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-fg))))

   `(w3m-bold
     ((,class (:foreground ,darkokai-emph
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :weight bold))))

   `(w3m-image-anchor
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-cyan
                           :inherit link))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-cyan
                                    :inherit link))))

   `(w3m-image
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-cyan))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-cyan))))

   `(w3m-lnum-minibuffer-prompt
     ((,class (:foreground ,darkokai-emph))
      (,terminal-class (:foreground ,terminal-darkokai-emph))))

   `(w3m-lnum-match
     ((,class (:background ,darkokai-highlight-line))
      (,terminal-class (:background ,terminal-darkokai-highlight-line))))

   `(w3m-lnum
     ((,class (:underline nil
                          :bold nil
                          :foreground ,darkokai-red))
      (,terminal-class (:underline nil
                                   :bold nil
                                   :foreground ,terminal-darkokai-red))))

   `(w3m-session-select
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(w3m-session-selected
     ((,class (:foreground ,darkokai-emph
                           :bold t
                           :underline t))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :bold t
                                    :underline t))))

   `(w3m-tab-background
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-fg))))

   `(w3m-tab-selected-background
     ((,class (:background ,darkokai-bg
                           :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-bg
                                    :foreground ,terminal-darkokai-fg))))

   `(w3m-tab-mouse
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-yellow))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-yellow))))

   `(w3m-tab-selected
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-emph
                           :bold t))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-emph
                                    :bold t))))

   `(w3m-tab-unselected
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-fg))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-fg))))

   `(w3m-tab-selected-retrieving
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-red))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-red))))

   `(w3m-tab-unselected-retrieving
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-orange))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-orange))))

   `(w3m-tab-unselected-unseen
     ((,class (:background ,darkokai-highlight-line
                           :foreground ,darkokai-violet))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :foreground ,terminal-darkokai-violet))))

   ;; web-mode
   `(web-mode-builtin-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(web-mode-comment-face
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   `(web-mode-constant-face
     ((,class (:foreground ,darkokai-blue
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :weight bold))))

   `(web-mode-current-element-highlight-face
     ((,class (:underline unspecified
                          :weight unspecified
                          :background ,darkokai-highlight-line))
      (,terminal-class (:underline unspecified
                                   :weight unspecified
                                   :background ,terminal-darkokai-highlight-line))))

   `(web-mode-css-at-rule-face
     ((,class (:foreground ,darkokai-violet
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-violet
                                    :slant italic))))

   `(web-mode-css-pseudo-class-face
     ((,class (:foreground ,darkokai-green
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :slant italic))))

   `(web-mode-doctype-face
     ((,class (:foreground ,darkokai-comments
                           :slant italic
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :slant italic
                                    :weight bold))))

   `(web-mode-folded-face
     ((,class (:underline t))
      (,terminal-class (:underline t))))

   `(web-mode-function-name-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(web-mode-html-attr-name-face
     ((,class (:foreground ,darkokai-blue
                           :slant normal))
      (,terminal-class (:foreground ,terminal-darkokai-blue
                                    :slant normal))))

   `(web-mode-html-attr-value-face
     ((,class (:foreground ,darkokai-cyan
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-cyan
                                    :slant italic))))

   `(web-mode-html-tag-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(web-mode-keyword-face
     ((,class (:foreground ,darkokai-yellow
                           :weight normal))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :weight normal))))

   `(web-mode-preprocessor-face
     ((,class (:foreground ,darkokai-yellow
                           :slant normal
                           :weight unspecified))
      (,terminal-class (:foreground ,terminal-darkokai-yellow
                                    :slant normal
                                    :weight unspecified))))

   `(web-mode-string-face
     ((,class (:foreground ,darkokai-cyan))
      (,terminal-class (:foreground ,terminal-darkokai-cyan))))

   `(web-mode-type-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(web-mode-variable-name-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(web-mode-warning-face
     ((,class (:inherit font-lock-warning-face))
      (,terminal-class (:inherit font-lock-warning-face))))

   `(web-mode-block-attr-name-face
     ((,class (:inherit web-mode-html-attr-name-face))
      (,terminal-class (:inherit web-mode-html-attr-name-face))))

   `(web-mode-block-attr-value-face
     ((,class (:inherit web-mode-html-attr-value-face))
      (,terminal-class (:inherit web-mode-html-attr-value-face))))

   `(web-mode-block-comment-face
     ((,class (:inherit web-mode-comment-face))
      (,terminal-class (:inherit web-mode-comment-face))))

   `(web-mode-block-control-face
     ((,class (:inherit font-lock-preprocessor-face))
      (,terminal-class (:inherit font-lock-preprocessor-face))))

   `(web-mode-block-face
     ((,class (:background unspecified))
      (,terminal-class (:background unspecified))))

   `(web-mode-block-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-comment-keyword-face
     ((,class (:box 1
                    :weight bold))
      (,terminal-class (:box 1
                             :weight bold))))

   `(web-mode-css-color-face
     ((,class (:inherit font-lock-builtin-face))
      (,terminal-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-function-face
     ((,class (:inherit font-lock-builtin-face))
      (,terminal-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-priority-face
     ((,class (:inherit font-lock-builtin-face))
      (,terminal-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-property-name-face
     ((,class (:inherit font-lock-variable-name-face))
      (,terminal-class (:inherit font-lock-variable-name-face))))

   `(web-mode-css-selector-face
     ((,class (:inherit font-lock-keyword-face))
      (,terminal-class (:inherit font-lock-keyword-face))))

   `(web-mode-css-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-javascript-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-json-context-face
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   `(web-mode-json-key-face
     ((,class (:foreground ,darkokai-violet))
      (,terminal-class (:foreground ,terminal-darkokai-violet))))

   `(web-mode-json-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-param-name-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(web-mode-part-comment-face
     ((,class (:inherit web-mode-comment-face))
      (,terminal-class (:inherit web-mode-comment-face))))

   `(web-mode-part-face
     ((,class (:inherit web-mode-block-face))
      (,terminal-class (:inherit web-mode-block-face))))

   `(web-mode-part-string-face
     ((,class (:inherit web-mode-string-face))
      (,terminal-class (:inherit web-mode-string-face))))

   `(web-mode-symbol-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(web-mode-whitespace-face
     ((,class (:background ,darkokai-red))
      (,terminal-class (:background ,terminal-darkokai-red))))

   ;; whitespace-mode
   `(whitespace-space
     ((,class (:background unspecified
                           :foreground ,darkokai-comments
                           :inverse-video unspecified
                           :slant italic))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-comments
                                    :inverse-video unspecified
                                    :slant italic))))

   `(whitespace-hspace
     ((,class (:background unspecified
                           :foreground ,darkokai-emph
                           :inverse-video unspecified))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-emph
                                    :inverse-video unspecified))))

   `(whitespace-tab
     ((,class (:background unspecified
                           :foreground ,darkokai-red
                           :inverse-video unspecified
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-red
                                    :inverse-video unspecified
                                    :weight bold))))

   `(whitespace-newline
     ((,class(:background unspecified
                          :foreground ,darkokai-comments
                          :inverse-video unspecified))
      (,terminal-class(:background unspecified
                                   :foreground ,terminal-darkokai-comments
                                   :inverse-video unspecified))))

   `(whitespace-trailing
     ((,class (:background unspecified
                           :foreground ,darkokai-orange-lc
                           :inverse-video t))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-orange-lc
                                    :inverse-video t))))

   `(whitespace-line
     ((,class (:background unspecified
                           :foreground ,darkokai-magenta
                           :inverse-video unspecified))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-magenta
                                    :inverse-video unspecified))))

   `(whitespace-space-before-tab
     ((,class (:background ,darkokai-red-lc
                           :foreground unspecified
                           :inverse-video unspecified))
      (,terminal-class (:background ,terminal-darkokai-red-lc
                                    :foreground unspecified
                                    :inverse-video unspecified))))

   `(whitespace-indentation
     ((,class (:background unspecified
                           :foreground ,darkokai-yellow
                           :inverse-video unspecified
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-yellow
                                    :inverse-video unspecified
                                    :weight bold))))

   `(whitespace-empty
     ((,class (:background unspecified
                           :foreground ,darkokai-red-lc
                           :inverse-video t))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-red-lc
                                    :inverse-video t))))

   `(whitespace-space-after-tab
     ((,class (:background unspecified
                           :foreground ,darkokai-orange
                           :inverse-video t
                           :weight bold))
      (,terminal-class (:background unspecified
                                    :foreground ,terminal-darkokai-orange
                                    :inverse-video t
                                    :weight bold))))

   ;; wanderlust
   `(wl-highlight-folder-few-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(wl-highlight-folder-many-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(wl-highlight-folder-path-face
     ((,class (:foreground ,darkokai-orange))
      (,terminal-class (:foreground ,terminal-darkokai-orange))))

   `(wl-highlight-folder-unread-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(wl-highlight-folder-zero-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(wl-highlight-folder-unknown-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(wl-highlight-message-citation-header
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(wl-highlight-message-cited-text-1
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(wl-highlight-message-cited-text-2
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(wl-highlight-message-cited-text-3
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(wl-highlight-message-cited-text-4
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(wl-highlight-message-header-contents-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(wl-highlight-message-headers-face
     ((,class (:foreground ,darkokai-red))
      (,terminal-class (:foreground ,terminal-darkokai-red))))

   `(wl-highlight-message-important-header-contents
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(wl-highlight-message-header-contents
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(wl-highlight-message-important-header-contents2
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(wl-highlight-message-signature
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   `(wl-highlight-message-unimportant-header-contents
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(wl-highlight-summary-answedarkokai-red-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(wl-highlight-summary-disposed-face
     ((,class (:foreground ,darkokai-fg
                           :slant italic))
      (,terminal-class (:foreground ,terminal-darkokai-fg
                                    :slant italic))))

   `(wl-highlight-summary-new-face
     ((,class (:foreground ,darkokai-blue))
      (,terminal-class (:foreground ,terminal-darkokai-blue))))

   `(wl-highlight-summary-normal-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(wl-highlight-summary-thread-top-face
     ((,class (:foreground ,darkokai-yellow))
      (,terminal-class (:foreground ,terminal-darkokai-yellow))))

   `(wl-highlight-thread-indent-face
     ((,class (:foreground ,darkokai-magenta))
      (,terminal-class (:foreground ,terminal-darkokai-magenta))))

   `(wl-highlight-summary-refiled-face
     ((,class (:foreground ,darkokai-fg))
      (,terminal-class (:foreground ,terminal-darkokai-fg))))

   `(wl-highlight-summary-displaying-face
     ((,class (:underline t
                          :weight bold))
      (,terminal-class (:underline t
                                   :weight bold))))

   ;; weechat
   `(weechat-error-face
     ((,class (:inherit error))
      (,terminal-class (:inherit error))))

   `(weechat-highlight-face
     ((,class (:foreground ,darkokai-emph
                           :weight bold))
      (,terminal-class (:foreground ,terminal-darkokai-emph
                                    :weight bold))))

   `(weechat-nick-self-face
     ((,class (:foreground ,darkokai-green
                           :weight unspecified
                           :inverse-video t))
      (,terminal-class (:foreground ,terminal-darkokai-green
                                    :weight unspecified
                                    :inverse-video t))))

   `(weechat-prompt-face
     ((,class (:inherit minibuffer-prompt))
      (,terminal-class (:inherit minibuffer-prompt))))

   `(weechat-time-face
     ((,class (:foreground ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments))))

   ;; which-func-mode
   `(which-func
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   ;; window-number-mode
   `(window-number-face
     ((,class (:foreground ,darkokai-green))
      (,terminal-class (:foreground ,terminal-darkokai-green))))

   ;; yascroll
   `(yascroll:thumb-text-area
     ((,class (:foreground ,darkokai-comments
                           :background ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :background ,terminal-darkokai-comments))))

   `(yascroll:thumb-fringe
     ((,class (:foreground ,darkokai-comments
                           :background ,darkokai-comments))
      (,terminal-class (:foreground ,terminal-darkokai-comments
                                    :background ,terminal-darkokai-comments))))

   ;; zencoding
   `(zencoding-preview-input
     ((,class (:background ,darkokai-highlight-line
                           :box ,darkokai-emph))
      (,terminal-class (:background ,terminal-darkokai-highlight-line
                                    :box ,terminal-darkokai-emph)))))

  (custom-theme-set-variables
   'darkokai
   `(ansi-color-names-vector [,darkokai-bg ,darkokai-red ,darkokai-green ,darkokai-yellow
                                          ,darkokai-blue ,darkokai-magenta ,darkokai-cyan ,darkokai-fg])

   ;; compilation
   `(compilation-message-face 'default)

   ;; fill-column-indicator
   `(fci-rule-color ,darkokai-highlight-line)

   ;; magit
   `(magit-diff-use-overlays nil)

   ;; highlight-changes
   `(highlight-changes-colors '(,darkokai-magenta ,darkokai-violet))

   ;; highlight-tail
   `(highlight-tail-colors
     '((,darkokai-highlight-line . 0)
       (,darkokai-green-lc . 20)
       (,darkokai-cyan-lc . 30)
       (,darkokai-blue-lc . 50)
       (,darkokai-yellow-lc . 60)
       (,darkokai-orange-lc . 70)
       (,darkokai-magenta-lc . 85)
       (,darkokai-highlight-line . 100)))

   ;; pos-tip
   `(pos-tip-foreground-color ,darkokai-bg)
   `(pos-tip-background-color ,darkokai-yellow)

   ;; vc
   `(vc-annotate-color-map
     '((20 . ,darkokai-red)
       (40 . "#CF4F1F")
       (60 . "#C26C0F")
       (80 . ,darkokai-yellow)
       (100 . "#AB8C00")
       (120 . "#A18F00")
       (140 . "#989200")
       (160 . "#8E9500")
       (180 . ,darkokai-green)
       (200 . "#729A1E")
       (220 . "#609C3C")
       (240 . "#4E9D5B")
       (260 . "#3C9F79")
       (280 . ,darkokai-cyan)
       (300 . "#299BA6")
       (320 . "#2896B5")
       (340 . "#2790C3")
       (360 . ,darkokai-blue)))
   `(vc-annotate-very-old-color nil)
   `(vc-annotate-background nil)

   ;; weechat
   `(weechat-color-list
     (unspecified ,darkokai-bg ,darkokai-highlight-line
                  ,darkokai-red-d ,darkokai-red
                  ,darkokai-green-d ,darkokai-green
                  ,darkokai-yellow-d ,darkokai-yellow
                  ,darkokai-blue-d ,darkokai-blue
                  ,darkokai-magenta-d ,darkokai-magenta
                  ,darkokai-cyan-d ,darkokai-cyan
                  ,darkokai-fg ,darkokai-emph))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'darkokai)

;; Local Variables:
;; no-byte-compile: t
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode 1))
;; eval: (when (fboundp 'aggressive-indent-mode) (aggressive-indent-mode -1))
;; fill-column: 95
;; End:

;;; darkokai-theme.el ends here
