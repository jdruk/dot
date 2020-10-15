;;; neotree.el --- A tree plugin like NerdTree for Vim

;;; Commentary:

;; Copyright (C) 2014 jaypei

;; Author: josafa <devjosafa@gmail.com>

;;; Code:

(setq inhibit-startup-message t)

;; remover menus
(tool-bar-mode -1)
(menu-bar-mode -1)

					;
;; remover barra de rolagem
(scroll-bar-mode -1)

;; adicionar número das linhas
(global-linum-mode t)

;; pacotes
(require 'package)
(setq package-enable-at-startup nil)

;; gerenciomento MELPA
(add-to-list 'package-archives
	     '("melpa"."https://melpa.org/packages/"))
(package-initialize)

;; checa se pacote estar instalado
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 
(use-package try
  :ensure t)

;; all-the-icons
;; pacotes de icones para neotree
(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

; popup com possiveis comandos
(use-package which-key
   :ensure t
   :config (which-key-mode))

;; auto-complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;; neotree
(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
  :bind (("C-\\".'neotree-toggle)))

; tema
(use-package rebecca-theme
  :ensure t
  :config (load-theme 'rebecca t))

(use-package flycheck
  :ensure t
  :delight " ✓"
  :init (global-flycheck-mode))

(use-package elixir-mode
  :ensure t)

;; ace-window
(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

;; ergnoemacs-mode
;; C-c + C-v e etc
(use-package ergoemacs-mode
  :ensure t
  :config
  (progn
    (setq ergoemacs-theme nil)
    (setq ergoemacs-keyboard-layout "us")
    (ergoemacs-mode 1)))

;; hl-todo FIXME
;(use-package hl-todo
;  :ensure t
;  :config
;  (global-hl-todo-mode 1))


;; Redimensionamento de janela
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<down>") 'enlager-window)
(global-set-key (kbd "C-<tab>") 'other-window)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e208e45345b91e391fa66ce028e2b30a6aa82a37da8aa988c3f3c011a15baa22" default))
 '(package-selected-packages
   '(hl-todo elixir-mode flycheck-mix all-the-icons-dired all-the-icons-dired-mode ergoemacs-mode ace-window flycheck flucheck fluceck all-the-icons nerdtree auto-complete try use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
