# Github Actions Learning 

- Create GitHub actions in your repo with the path `.github/workflows`. 

- Use the GitHub market place to find prebuilt actions and community actions. 
  - See the marketplace here [https://github.com/marketplace](https://github.com/marketplace)
  - We might use the `checkout` action to checkout code from the repo automatically. 
  

## Jobs 

When you have multiple jobs in an action, by default they are all executed in parallel unless otherwise specified. 

Use the `needs` keyword on a job to specify that it requires another job to complete. 

## Artifacts Upload/Download

**Artifact Actions**
- [Upload a Build Artifact](https://github.com/marketplace/actions/upload-a-build-artifact)
- [Download a Build Artifact](https://github.com/marketplace/actions/download-a-build-artifact)