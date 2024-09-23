# Github Notes Continued - Reusable Workflows 

## Reusing workflows 

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


