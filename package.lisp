;;;; package.lisp

(defpackage #:todo-checker
  (:use #:cl)
  (:export #:ticket-status)
  (:shadowing-import-from #:iterate
			  #:iter
			  #:for
			  #:finally
			  #:collect))

