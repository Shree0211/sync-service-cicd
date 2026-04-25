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

* Jenkins Pipeline Overview

1. Checkout Source Code
2. Build Application 
3. Run Unit Tests
4. Package Application
5. Deploy to Target Environment
6. Verification

* PR Review Workflow 
- When a pull request is opened code is built and unit tests are done. 
- Validate changes before merging.

* Merge Workflow
- Dev stage -> Deploy to QA
- Staging stage -> Deploy to staging
- Production stage -> Manual approval is required by internal/production team

----------------------------------------------------------------------------------------------
