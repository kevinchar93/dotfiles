;; add melpa packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; ensure intended version of emacs
(when (< emacs-major-version 24)
  for important compatibility libraries like cl-lib
  (add-to-list 'package-archives
  	       '("gnu" . "http://elpa.gnu.org/packages/")))

;; init packages
(package-initialize)

;; configure auto complete
(ac-config-default)
(require 'auto-complete-config)
(require 'go-autocomplete)

;; configure golint
(add-to-list 'load-path (concat (getenv "GOPATH")
				"/src/github.com/golang/lint/misc/emacs"))
(require 'golint)

;; project explorer
(require 'project-explorer)
(global-set-key (kbd "M-e")
		'project-explorer-toggle)

;; load the go dev environment setup
(defun go-mode-setup ()
  (setq compile-command "go build -v && go test -v && go vet *.go && golint")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump))

;; <describe>
(add-hook 'go-mode-hook 'go-mode-setup)

;; enable wind move keys (shift + arrow) to move between eindows
(windmove-default-keybindings)

;; activate electric pair mode
(electric-pair-mode)

;; ensure tab sizes have a width in emacs of 4
(setq default-tab-width 4)
(defvaralias 'c-basic-offset 'default-tab-width)
(defvaralias 'cperl-indent-level 'default-tab-width)

;; turn on line numbers for opened file buffers only
(add-hook 'find-file-hook 'linum-mode)

;; turn on 80 column marker limit when a file buffer is opened
(add-hook 'find-file-hook (lambda () (interactive) (column-marker-1 80)))
