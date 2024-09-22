# GitHub Actions 

You can find some Github actions in the .github/workflows folder as well as notes below. 

## 📙 Notes 

- [Chapter 1 - Core Concepts](./Notes/Chapter-1.md)
  - Event Workflow Triggers   
  - Jobs 
  - Artifacts Upload/Download
  - Using Concurrency 
  - 🕰️ Timeouts 
  - Environment Variable Storage 
  - Repository Level Secrets/Variables 
  - Example GitHub Actions
- [Chapter 1.1 - Core Concepts](./Notes/Chapter-1.1.md)
  - Matrix Strategies (Example #11)
  - [Contexts](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/accessing-contextual-information-about-workflow-runs) 
  - [Expressions](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/evaluate-expressions-in-workflows-and-actions) (Example #13)
  - [Workflow Event Filters and Activity Types](https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows)
  - [Skipping workflow runs](https://docs.github.com/en/actions/managing-workflow-runs-and-deployments/managing-workflow-runs/skipping-workflow-runs)
  - [Debug Logging](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/troubleshooting-workflows/enabling-debug-logging)
  - [Workflow Logs via RestAPI](https://docs.github.com/en/rest/actions/workflows?apiVersion=2022-11-28) (No example workflow)
  - [Workflow Dispatch Inputs](https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions#onworkflow_dispatch) (Example #15) 
  - Triggers Events with Webhooks 
- [Chapter 2 - Additional Deployment Concepts](./Notes/Chapter-2.md)
  - Expressions
  - Status Check Functions 
  - [Cache Dependencies for a Job](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/caching-dependencies-to-speed-up-workflows)
  - GitHub Packages 
  - [Publish Node.js packages](https://docs.github.com/en/actions/use-cases-and-examples/publishing-packages/publishing-nodejs-packages)
  - [Job Container](https://docs.github.com/en/actions/writing-workflows/choosing-where-your-workflow-runs/running-jobs-in-a-container)
  - [Service Containers](https://docs.github.com/en/actions/use-cases-and-examples/using-containerized-services/about-service-containers)
- [Chapter 3 - Kubernetes Based Deploy Concepts](./Notes/Chapter-3.md)



## Retrieve Chapter Concepts from Markdown Files 

```bash
ggrep "^##" Chapter-1.md | sed 's/^##/-/'
```