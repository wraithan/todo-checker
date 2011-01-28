;;;; todo-checker.lisp

(in-package #:todo-checker)

(defvar *default-todo-file* (merge-pathnames "sync/work/todo.org" (user-homedir-pathname)))

(defun ticket-status (&key (todo-file-pathname *default-todo-file*))
  (let ((ticket-list (jira-utils:get-list-of-issues))
	(todo-string (alexandria:read-file-into-string todo-file-pathname)))
    (iter (for ticket in ticket-list)
	  (if (search ticket todo-string)
	      (collect ticket into known-tickets)
	      (collect ticket into unknown-tickets))
	  (finally (return (list known-tickets unknown-tickets))))))
