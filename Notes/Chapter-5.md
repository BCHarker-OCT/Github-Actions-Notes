# Custom GH Actions 

## Types of Custom Actions 

**Composite Actions: **
- Executed on many OS runners
- Combine workflow steps 
-  Simplified workflow
- Complex creation and maintenance

**Docker Actions:**
- Flexible Dockeractions
- Linux-Exclusive Runners
- Fit for special env
- Slower than custom actions

**JavaScript Actions:**
- JavaScript, NodeJS
- Executed on multipleOS runners
- Suitable for lightweight tasks
- Interference risks with other runners

Any custom action requires a [metadata](https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions) file to be created for it. 

## Composite Actions 

- [See GitHub Documentation](https://docs.github.com/en/actions/sharing-automations/creating-actions/creating-a-composite-action)

> A composite action in GitHub Actions is a type of action that allows you to combine multiple steps into a single, reusable action. This helps to reduce code duplication and improve the maintainability of your workflow files. Essentially, it encapsulates a sequence of actions into one entity, making your workflows more modular and efficient12.

> For example, instead of writing the same set of steps in multiple workflows, you can create a composite action that includes all those steps and then reuse it across different workflows. This can include multiple run steps, marketplace actions, or a combination of both.

## Docker Actions 

