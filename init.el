;;;;;;;;;;;;;;;;;;;;LoadPath;;;;;;;;;;;;;;;;;;;;
;; load-pathを再帰的に追加。
(defun add-to-load-path (&rest paths)
(let (path)
    (dolist (path paths paths)
    (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
    (add-to-list 'load-path default-directory)
     (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
         (normal-top-level-add-subdirs-to-load-path))))))

;; for elpa
(add-to-load-path "elpa")


;;php mode
(require 'php-mode)

;;auto-compleate
(add-to-list 'load-path "~/.emacs.d/auto-compleate-1.3.1/")
(require 'auto-complete-config)
;;This path is information indicating where to find the dictionary file
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-compleate-1.3.1//ac-dict")
(ac-config-default)


;;auto-complete for latex
;;(add-to-list 'load-path "~/.emacs.d/auto-compleate-1.3.1/forLatex/")
(add-to-list 'ac-modes 'tex-mode)
(add-to-list 'ac-modes 'latex-mode)

;;scala-mode
(add-to-list 'load-path "~/.emacs.d/scala-mode")
(require 'scala-mode-auto)

;;back-screen
(setq default-frame-alist
      (append
       '((foreground-color . "gray")  
         (background-color . "black") 
         (cursor-color     . "blue")  
         (width            . 114)     
         (height           . 44)      
         (top              . 50)      
         (left             . 10)      
        )
 default-frame-alist))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;;shortcut key
(define-key global-map [(C h)] 'delete-backward-char)


;;melpha
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
