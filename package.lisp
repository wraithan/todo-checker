;;;; package.lisp

(defpackage #:todo-checker
  (:use #:cl)
  (:export #:missing-tickets)
  (:shadowing-import-from #:iterate
			  #:iter
			  #:for
			  #:finally
			  #:collect))

