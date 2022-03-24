;;;; projectwarrior.asd

(asdf:defsystem #:projectwarrior
  :description "GTD Review is a guided walk through your GTD Weekly Review that works with taskwarrior."
  :author "Jonathan A. Bennett <doulos05@gmail.com>"
  :license "MIT"
  :version "0.2.0"
  :serial t
  :depends-on ("yason" "cl-ansi-text" "uuid" "cl-slug" "cl-json" "cl-utilities")
  :components
  ((:file "package")
   (:file "config" :depends-on ("package"))
   (:file "utils" :depends-on ("package" "config"))
   (:file "task" :depends-on ("package" "config" "utils"))
   (:file "project" :depends-on ("package" "config" "utils"))
   (:file "reports" :depends-on ("project" "config" "utils"))
   (:file "review" :depends-on ("package" "config" "utils"))
   (:file "projectwarrior" :depends-on ("package" "config" "utils" "project" "review")))
  :build-operation :program-op
  :build-pathname "projectwarrior"
  :entry-point "projectwarrior:main")

(asdf:defsystem #:projectwarrior/tw-hook
  :description "This simple hook for Taskwarrior adds newly created projects to a projects.txt file for use in a weekly review."
  :author "Jonathan A. Bennett <doulos05@gmail.com>"
  :license "MIT"
  :version "0.0.1"
  :serial t
  :depends-on ("projectwarrior")
  :components ((:file "tw-hook/package")
               (:file "tw-hook/tw-hook"))
  :build-operation :program-op
  :build-pathname "on-exit-projects-list"
  :entry-point "tw-hook:main")
