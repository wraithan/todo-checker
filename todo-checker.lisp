;;;; todo-checker.lisp

(in-package #:todo-checker)

(defvar *default-todo-file* (merge-pathnames "sync/work/todo.org" (user-homedir-pathname)))

(defun missing-tickets (&key (todo-file-pathname *default-todo-file*))
  (let ((ticket-list (jira-utils:get-list-of-issues))
	(todo-string (alexandria:read-file-into-string todo-file-pathname)))
    (iter (for ticket in ticket-list)
	  (when (search ticket todo-string)
	    (delete ticket ticket-list))
	  (finally (return ticket-list)))))

