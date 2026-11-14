(define-module (manifest)
  #:use-module (guix profiles)
  #:use-module (gnu packages java)
  #:use-module (gnu packages maven)
  #:export (%project-manifest))

(define %project-manifest
  (packages->manifest
   (list `(,openjdk11 "jdk")
         maven)))

%project-manifest
