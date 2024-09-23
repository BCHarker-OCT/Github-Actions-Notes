# GitHub Actions Learning Chapter 3 

## Adding a `KUBECONFIG` file to your action
You can add this file as a secret into your repository, simply copy/paste the file. 

### Using the `KUBECONFIG` file and setting context 

```
- name: Set Kubeconfig 
  uses: azure/k8s-set-context@v3 
  with: 
    method: kubeconfig
    kubeconfig: ${{ secrets.KUBECONFIG }}
```

## Kubernetes Placeholders 

In kubernetes manifests we can setup placeholders that will be replaced during the run of the Github action. 

For example in the k8s manifest these placeholders might look like this: 
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: solar-system
  name: solar-system
  namespace: _{_NAMESPACE_}_
spec:
  replicas: _{REPLICAS_}_
  selector:
    matchLabels:
      app: solar-system
    strategy: {}
    template:
      metadata:
        labels:
          app: solar-system
      spec:
        containers:
        - image: _{_IMAGE_}_
```

Notice the convention of `_{_VARNAME_}_`

Create a variable named `NAMESPACE` and `REPLICAS`. 
We can use the [Replace Tokens Action](https://github.com/marketplace/actions/replace-tokens). 

```
      - name: Replace Token in Manifest Files 
        uses: cshleiden/replace-tokens@v1.3
        with:
          tokenPrefix: '_{_'
          tokenSuffix: '_}_'
          files: '["kubernetes/development/*.yaml"]'
        env:
          NAMESPACE: ${{ vars.NAMESPACE }}
          REPLICAS: ${{ vars.REPLICAS }}
          IMAGE: ${{ vars.DOCKERHUB_USERNAME }}/solar-system:${{ github.sha }}
          INGRESS_IP: 
```

## [Setting an Environment Variable](docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#setting-an-environment-variable)

```bash
echo "{environment_variable_name}={value}" >> "$GITHUB_ENV"
```

> [!TIP]  
> This method allows steps within the same job to share the environment variables! It DOES NOT allow sharing env vars between jobs! 

## [Passing values between steps and jobs in a workflow](docs.github.com/en/actions/learn-github-actions/variables#passing-values-between-steps-and-jobs-in-a-workflow)

> If you generate a value in one step of a job, you can use the value in subsequent steps of the same job by assigning the value to an existing or new environment variable and then writing this to the GITHUB_ENV environment file. The environment file can be used directly by an action, or from a shell command in the workflow file by using the run keyword. For more information, see "Workflow commands for GitHub Actions."

> If you want to pass a value from a step in one job in a workflow to a step in another job in the workflow, you can define the value as a job output. You can then reference this job output from a step in another job. For more information, see "Workflow syntax for GitHub Actions."

**[👀 See Also](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/passing-information-between-jobs)**


**Example from GitHub**
```yaml
jobs:
  job1:
    runs-on: ubuntu-latest
    # Map a step output to a job output
    outputs:
      output1: ${{ steps.step1.outputs.test }}
      output2: ${{ steps.step2.outputs.test }}
    steps:
      - id: step1
        run: echo "test=hello" >> "$GITHUB_OUTPUT"
      - id: step2
        run: echo "test=world" >> "$GITHUB_OUTPUT"
  job2:
    runs-on: ubuntu-latest
    needs: job1
    steps:
      - env:
          OUTPUT1: ${{needs.job1.outputs.output1}}
          OUTPUT2: ${{needs.job1.outputs.output2}}
        run: echo "$OUTPUT1 $OUTPUT2"
```

## Understanding GitHub Environments 

We can use environments to set specific rules for deployment, such as forced review, deploy delay timer, and making sure we don't deploy to prod unless we're on the main branch. 

> [!NOTE]
> For variables set at the repository level these take precedence over variables set at the environment level within the Github web GUI. 

Delineating between `env` and `environment`:
- `env` used for Environment variables
- `environment` used for Github Repo Environments

**Example:**
```yamlß
name: Pulling Variables from Environments

on:
    workflow_dispatch:
      inputs:
        environment: 
            description: "Environment to run in"
            type: environment
            required: true   
jobs:
    build-and-debug:
        environment: 
          name: ${{ inputs.environment }}
        runs-on: ubuntu-latest
        steps:
            # Get inputs for dispatch
            - name: Print workflow inputs and env var set in repo
              run: |
                echo "Environment: ${{ inputs.environment }}"
                echo "1. AWS Account Number (from environment var): ${{ vars.AWS_ACCOUNT_NUMBER }}"
```

