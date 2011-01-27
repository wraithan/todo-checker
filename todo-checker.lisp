;;;; todo-checker.lisp

(in-package #:todo-checker)

(defun missing-tickets () 
  (let ((ticket-list (jira-utils:get-list-of-issues)) (todo-string (get-todo-list)))
    (iter (for ticket in ticket-list)
	  (when (search ticket todo-string)
	    (delete ticket ticket-list))
	  (finally (return ticket-list)))))

(defun get-todo-list ()
  (let ((todo (open (merge-pathnames "sync/work/todo.org" (user-homedir-pathname)))))
    (when todo)
    (let ((todo-string (make-array (file-length todo) :element-type 'character :fill-pointer t)))
      (read-sequence todo-string todo)
      todo-string)))

