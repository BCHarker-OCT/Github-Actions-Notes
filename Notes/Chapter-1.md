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
$${{ vars.DOCKER_USERNAME }}
```

## Example GitHub Actions
-  [Chapter-1-Examples](../Chapter-1-Examples)
-  See also disable GH actions in the workflows folder.