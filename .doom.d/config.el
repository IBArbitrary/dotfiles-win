;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Rajeshkumar K"
      user-mail-address "k.rajeshkumar.1411@gmail.com")

(setq-default
 delete-by-moving-to-trash t
 tab-width 4
 uniquify-buffer-name-style 'forward
 window-combination-resize t
 x-stretch-cursor t)

(setq undo-limit 80000000               ; undo upto 80MB
      evil-want-fine-undo t
      auto-save-default t               ; you know it
      inhibit-compacting-font-caches t
      truncate-string-ellipsis "…")     ; concise and precise

(delete-selection-mode 1)   ; type away the selection
(display-time-mode 1)
(unless (equal "Battery status not available"   ; use battery indicator
               (battery))                       ; while using laptop
  (display-battery-mode 1))

(setq display-line-numbers-type 'relative)

(defun doom-modeline-cond-buf-encoding ()
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))
(add-hook 'after-change-major-mode-hook #'doom-modeline-cond-buf-encoding)

(setq doom-font (font-spec :family "Source Code Pro" :size 15)
      doom-variable-pitch-font (font-spec :family "Source Code Pro"
                                          :size 15)
      doom-big-font (font-spec :family "Source Code Pro" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq doom-theme 'doom-gruvbox)

(use-package keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(after! org
  (setq org-directory "D:\\documents\\org"
        org-agenda-files '("D:\\documents\\org\\agenda.org")
        org-ellipsis " [+]"
        org-log-done 'time
        org-hide-emphasis-markers t
        org-hide-leading-stars t
        org-superstar-leading-bullet ?\s
        org-indent-mode-turns-on-hiding-stars nil
        org-tags-column -80))

(add-hook 'org-mode-hook (lambda ()
                           (setq org-hidden-keywords '(title author))
                           (set-face-attribute 'org-level-8 nil
                                               :weight 'bold
                                               :inherit 'default)
                           (set-face-attribute 'org-level-7 nil
                                               :inherit 'org-level-8)
                           (set-face-attribute 'org-level-6 nil
                                               :inherit 'org-level-8)
                           (set-face-attribute 'org-level-5 nil
                                               :inherit 'org-level-8)
                           (set-face-attribute 'org-level-4 nil
                                               :inherit 'org-level-8)
                           (set-face-attribute 'org-level-3 nil
                                               :inherit 'org-level-8
                                               :foreground "#b8bb26")
                           (set-face-attribute 'org-level-2 nil
                                               :inherit 'org-level-8
                                               :foreground "#fe8019")
                           (set-face-attribute 'org-level-1 nil
                                               :inherit 'org-level-8
                                               :foreground "#fabd2f")
                           (setq org-cycle-level-faces nil)
                           (setq org-n-level-faces 3)
                           (set-face-attribute 'org-document-title nil
                                               :foreground "#fb4934"
                                               :weight 'bold
                                               )
                           (set-face-attribute 'org-document-info nil
                                               :foreground "#83a598"
                                               :italic t
                                               )
                           (setq org-superstar-headline-bullets-list
                                 '("■" "◆" "●"))))

;; Stop cycling bullets to emphasize hierarchy of headlines.
(setq org-superstar-cycle-headline-bullets nil)
;; for scaling latex previews according to font size
(add-hook 'org-mode-hook 'org-fragtog-mode)
(setq my-org-latex-preview-scale 1.0)
(defun org-latex-preview-advice (orig-func &rest args)
  (let ((old-val (copy-tree org-format-latex-options)))
    (setq org-format-latex-options
          (plist-put org-format-latex-options
                     :scale
                     (* my-org-latex-preview-scale
                        (expt
                         text-scale-mode-step text-scale-mode-amount))))
    (apply orig-func args)
    (setq org-format-latex-options old-val)))
(advice-add 'org-latex-preview :around #'org-latex-preview-advice)

(add-hook 'org-mode-hook
          (lambda ()
            (org-bullets-mode 1)
            (org-superstar-mode 1)
            ))

(setq deft-directory "D:\\documents\\org"
      deft-extensions '("org" "txt" "md")
      deft-recursive t)

(setq TeX-view-program-selection '((output-pdf "SumatraPDF")))

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; automatically tangles code only when it is dotemacs.org
(add-hook 'org-mode-hook
          (lambda ()
            (if (and (stringp buffer-file-name)
                     (string-match "c:/Users/kraje/.doom.d/dotemacs.org"
                                   buffer-file-name))
                (add-hook 'after-save-hook #'org-babel-tangle
                          :append :local))))
