;;;; todo-checker.asd

(asdf:defsystem #:todo-checker
  :serial t
  :depends-on (#:jira-utils #:alexandria)
  :components ((:file "package")
               (:file "todo-checker")))

