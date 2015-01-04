;;; flymake-vala.el --- A flymake handler for vala-mode files
;;
;;; Author: Daniel Lawrence <dannyla@linux.com>
;;; URL: https://github.com/daniellawrence/flymake-vala
;; Version: 20150104.0001
;;; X-Original-Version: DEV
;;; Package-Requires: ((flymake-easy "0.1"))
;;;
;;; Commentary:
;; Usage:
;;   (require 'flymake-vala)
;;   (add-hook 'vala-mode-hook 'flymake-vala-load)
;;
;; Uses flymake-easy, from https://github.com/purcell/flymake-easy

;;; Code:

(require 'flymake-easy)

;; hello.vala:3.2-3.14: error: Return: Cannot convert from `string' to `int'
;;	return "foo";
;;	^^^^^^^^^^^^^
;; Compilation failed: 1 error(s), 0 warning(s)


(defconst flymake-vala-err-line-patterns
 '(("^\\(.*\.vala\\):\\([0-9]+\\)\.\\(.*\\)$" nil 2 nil 3)))

(defvar flymake-vala-executable "vala"
  "The vala executable to use for syntax checking.")

;; Invoke vala with '-c' to get syntax checking
(defun flymake-vala-command (filename)
  "Construct a command that flymake can use to check vala source."
  (list flymake-vala-executable "-c" filename))

;;;###autoload
(defun flymake-vala-load ()
  "Configure flymake mode to check the current buffer's vala syntax."
  (interactive)
  (flymake-easy-load 'flymake-vala-command
                     flymake-vala-err-line-patterns
                     'tempdir
                     "vala")
 

(provide 'flymake-vala)
;;; flymake-vala.el ends here
