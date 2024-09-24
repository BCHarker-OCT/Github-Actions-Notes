# Github Notes Continued - Reusable Workflows 

## [Reusing workflows](https://docs.github.com/en/actions/sharing-automations/reusing-workflows)

To reuses a workflow the `on` must use the `workflow_call`

**Example:**
```
name: Reusable Workflow 
on:
  workflow_call:
```

**Terminology**
- Worker that uses a reusable workflow is called a `caller workflow`
- The reusable workflow itself is referred to as the `called workflow`


## [Sharing actions in a private repo](https://docs.github.com/en/actions/sharing-automations/sharing-actions-and-workflows-from-your-private-repository)

**Example from GitHub**
```
jobs:
  workflowA-calls-workflowB:
    uses: octo-org/example-repo/.github/workflows/B.yml@main
    secrets: inherit # pass all secrets
```

## Secrets in Reusable Workflows 

> [!NOTE]
> You must pass secrets and environment variables to the called workflows explictly or use inherit. 

**Inherit Example:**
```
jobs:
  call-workflow-passing-data:
    uses: octo-org/example-repo/.github/workflows/reusable-workflow.yml@main
    with:
      config-path: .github/labeler.yml
    secrets: inherit
```

## [Using Outputs from a Reusable Workflow](https://docs.github.com/en/actions/sharing-automations/reusing-workflows#using-outputs-from-a-reusable-workflow)

This can be helpful when the called workflow has data the caller workflow needs. This allows creating outputs that are accessible between jobs. 

## [Starter Workflows](https://docs.github.com/en/actions/sharing-automations/creating-workflow-templates-for-your-organization)

Workflow Templates can be defined at an Organizational level allowing anyone with access to setup and use the actions. 

