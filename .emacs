;;-<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>-+
;; general options regardless the OS                                          |
;;-<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>-+

;; UTF-8 as the standard for file encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; don't show initial emacs-logo and info
(setq inhibit-splash-screen t)

;; dont show the GNU splash screen
(setq inhibit-startup-message t)

;; show a fancy message on initial scratch
(setq initial-scratch-message "")

;; show line-number
(global-linum-mode t)

;; Show separator | after the line number
(setq linum-format "%4d \u2502 ")

;; show line-number in the mode line
;;(line-number-mode 1)
;; show column-number in the mode line
;;(column-number-mode 1)

;; Set standard indent to 2 rather that 4
(setq standard-indent 4)

;; c-mode indentation
(setq c-default-style "bsd"
      c-basic-offset 4)

;; Use only spaces to indent instead of TAB & spaces
(setq-default indent-tabs-mode nil)

;; open unidentified files in text mode
(setq default-major-mode 'text-mode)

;; highlight region between point and mark
(transient-mark-mode t)

;; highlight during query
(setq query-replace-highlight t)

;; highlight incremental search
(setq search-highlight t)

;; show matching parenthesis.
(show-paren-mode t)

;; make all <yes or no> prompts show <y or n> instead
(fset 'yes-or-no-p 'y-or-n-p)

;; do only one line scrolling
(setq scroll-step 1)

;; disable menu bar
(menu-bar-mode -1)

;; delete all triling whitespaces (buffer or selection)
(setq delete-trailing-whitespace-p t)

;; don't add new lines to the end of a file when using down-arrow key
(setq next-line-add-newlines nil)

; put autosave files and backup files (ie foo~) in ~/.emacs.d/
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups"))))
;; create the autosave, backups dirs if necessary
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

;; Compile and handling regions for errors
(require 'cc-mode)
(define-key c-mode-map (kbd "C-c c") 'compile)
(define-key c-mode-map (kbd "C-c ,") 'comment-region)
(define-key c-mode-map (kbd "C-c .") 'uncomment-region)
(define-key c-mode-map (kbd "C-c C-c") 'next-error)



;;-<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>-+
;; specific options for each OS                                               |
;;-<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>--<>-+

;;-<>--<>--<>--<>--<>--<>--<>--<>-+
;; windows nt, xp, vista, 7       |
;;-<>--<>--<>--<>--<>--<>--<>--<>-+
(cond ((eq system-type 'windows-nt)
       ;; setting env var path
       (setenv "PATH"
               (concat
                "C:\\mta\\emacs-25.0.93\\bin" ";"
                "C:\\mta\\msys64\\mingw64\\bin" ";"
                "C:\\mta\\msys64\\usr\\bin" ";"
                "C:\\mta\\msys64\\mingw64\\x86_64-w64-mingw32\\bin" ";"
                (getenv "PATH"))
               )
       ;; setting env var exec-path
       (setenv "EXEC-PATH"
               (concat
                "C:\\mta\\emacs-25.0.93\\bin" ";"
                "C:\\mta\\msys64\\mingw64\\bin" ";"
                "C:\\mta\\msys64\\usr\\bin" ";"
                "C:\\mta\\msys64\\mingw64\\x86_64-w64-mingw32\\bin" ";"
                (getenv "EXEC-PATH")
                ))

       ;; emacs for windows uses C:/Users/<user_name>/AppData/Roaming/ as home dir
       ;; Added by Package.el
       (package-initialize)

       (custom-set-variables
        ;; custom-set-variables was added by Custom.
        ;; If you edit it by hand, you could mess it up, so be careful.
        ;; Your init file should contain only one such instance.
        ;; If there is more than one, they won't work right.
        '(ansi-color-faces-vector
          [default default default italic underline success warning error])
        '(column-number-mode t)
        '(custom-enabled-themes (quote (misterioso)))
        '(display-time-mode t)
        '(show-paren-mode t)
        '(size-indication-mode t)
        '(tool-bar-mode nil)
        '(tooltip-mode nil))

       '(package-archives
         (quote
          (("gnu" . "http://elpa.gnu.org/packages/")
           ("marmalade" . "https://marmalade-repo.org/packages/")
           ("melpa" . "http://melpa.org/packages/")
           ("org" . "http://orgmode.org/elpa/"))))

       (custom-set-faces
        ;; custom-set-faces was added by Custom.
        ;; If you edit it by hand, you could mess it up, so be careful.
        ;; Your init file should contain only one such instance.
        ;; If there is more than one, they won't work right.
        '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :weight normal :height 102 :width normal)))))
       )

;;-<>--<>--<>--<>--<>--<>--<>--<>-+
;; gnu/linux                      |
;;-<>--<>--<>--<>--<>--<>--<>--<>-+
      ((eq system-type 'gnu/linux)
       ;; auctex
       ;;(load "auctex.el" nil t t)
       ;;(load "preview-latex.el" nil t)

       ;; set the variable TeX-PDF-mode to true in order to produce pdf file
       ;; (rather than a dvi)
       (setq TeX-PDF-mode t)
       )
)
