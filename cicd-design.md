** Deployment & CI/CD Design **

* Branching Strategy

- feature/*  →>Feature development
- develop    →>QA environment
- staging    →>Staging environment
- main       →>Production environment

Production Safety
- Direct push to main branch is restricted.
- Pull request manual approval is required in Jenkins.

Environment Mapping

 Branch   |  Environment 
 develop ->  QA
 staging ->  Staging 
 main    ->  Production 

----------------------------------------------------------------------------------------------

