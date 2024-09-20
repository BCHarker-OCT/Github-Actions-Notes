# Github Actions Basic Concepts

- Create GitHub actions in your repo with the path `.github/workflows`. 

- Use the GitHub market place to find prebuilt actions and community actions. 
  - See the marketplace here [https://github.com/marketplace](https://github.com/marketplace)
  - We might use the `checkout` action to checkout code from the repo automatically. 
  
## Event Workflow Triggers   

- [GitHub Documentation](https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows)

- schedule (cron syntax) 
- workflow_dispath (manual run job)
  

## Jobs 

When you have multiple jobs in an action, by default they are all executed in parallel unless otherwise specified. 

Use the `needs` keyword on a job to specify that it requires another job to complete. 

## Artifacts Upload/Download

**Artifact Actions**
- [Upload a Build Artifact](https://github.com/marketplace/actions/upload-a-build-artifact)
- [Download a Build Artifact](https://github.com/marketplace/actions/download-a-build-artifact)

Artifacts are stored for 90 days by default. Can be changed in GitHub if more is needed. 
500mb in free accounts maximum artifact size. 

## Using Concurrency 

- [Github Concurrency Documentation](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/control-the-concurrency-of-workflows-and-jobs)

We can enable at the workflow level or the job level. 

```
concurrency: 
  group: production-deployment 
  cancel-in-progress: true

```

`cancel-in-progress` will cancel any other running action so the workflow will be run. 

If the cancel is set to false or not setup otherwise, then it will wait until the first action's step is completed before moving onto the next step. 

## 🕰️ Timeouts 
GitHub actions will automatically timeout at 6 hours. 

We can specify timeouts at the step or job level.

A job-level timeout in a GitHub Action sets a limit for the entire job, not for each individual step. This means that the total execution time of all steps combined within that job cannot exceed the specified timeout. If the job exceeds this limit, GitHub will automatically cancel it12.

```yaml
# Timeouts Example
jobs: 
    docker_build: 
        runs-on: ubuntu-latest 
        concurrency: 
            group: build 
        steps: 
        - name: Docker Build 
          run: echo docker build -t ${{ env.SIMPLE_VAR }} ${{ env.ANOTHER_VAR }}

    docker_deploy:
        # Job level timeout 
        # timeout-minutes: 1 
        needs: docker_build
        runs-on: ubuntu-latest
        concurrency:
            group: deploy
        steps: 
        - name: Docker Deploy
          timeout-minutes: 1
          run: |
             echo docker run -d  ${{ env.SIMPLE_VAR }} ${{ env.ANOTHER_VAR }}         
             sleep 9000
```



## Environment Variable Storage 

Env vars can be stored at the: 
1. Step level 
2. Job Level 
3. Workflow level 

Using the `env` vars in an action can be done using: `$ENV_VAR_NAME` or `${{ env.ENV_VAR_NAME }}`

## Repository Level Secrets/Variables 

- Organization Level (shared for all workflows)
  - Variables and Secrets can be defined here allow workflows to share env vars. 
- Repository Level 
- Environment Level 

You can access secrets and variables with the follow syntax in the workflow:
```
#SECRETS:
${{ secrets.MY_REPO_SECRET }}

# VARIABLES: 
${{ vars.DOCKER_USERNAME }}
```

## Example GitHub Actions
-  [Chapter-1-Examples](../Chapter-1-Examples)
-  See also disable GH actions in the workflows folder.