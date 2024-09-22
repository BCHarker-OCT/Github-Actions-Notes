# Continued GitHub Actions Learning 

## Expressions

We have `if` and `continue-on-error` expressions for added logic to our workflows.

**if**
```yaml
steps:
- name: Testing
  run: ./script.sh

jobs:
  deploy:
    if: github.ref == 'ref/heads/main'
  steps:
```

**continue-on-error**
```yaml
steps:
- name: Testing
  continue-on-error: true
  run: ./script.sh

jobs:
  deploy:
  continue-on-error: false
  steps:
```

Contexts: github, env, vars, job, jobs, steps, runner, secrets, matrix, needs, inputs, strategy

## Status Check Functions 
- success()
- failure()
- cancelled()
- always()

```yaml
steps:
- name: Build
  run: npm build
- name: Test
  run: npm test
  if: success()

steps:
- name: Always Run 
  run: echo "steps always runs"
  if: always()
```

## [Cache Dependencies for a Job](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/caching-dependencies-to-speed-up-workflows)

Files can be cached for workflows that are frequently used to speed up runs. File hashes can be used to make sure dependencies are not used unless the hash matches. 

```
      # An example of caches dependencies 
      - name: Cache NPM Dependencies
        uses: actions/cache@v3
        with:
          # Folder where dependencies are located 
          path: ~/.npm
          # Hash for file so if cache changes dependency loaded will also change 
          key: ${{ runner.os }}-node-modules-${{ hashFiles('package-lock.json') }} 

        
      # If cache is setup as above it will automatically be used. 
      - name: Install Dependencies 
        run: npm install 
```

## GitHub Packages 

Integrates with multiple package managers to easily manage packages

**Supports:**
- npm registry
- RubyGem
- Maven repository
- Gradle
- Docker
- NuGet package manager

**Benefits:** centralized management, secure distribution, simplified workflow

Use: GITHUB_TOKEN that grants access to the repository. 

**Package Registry Endpoints:**
```
npm.pkg.github.com
maven.pkg.github.com
nuget.pkg.github.com
rubygems.pkg.github.com
```

**Container Registry Enpoint:**
`ghcr.io/OWNER/image_name:version`

## [Publish Node.js packages](https://docs.github.com/en/actions/use-cases-and-examples/publishing-packages/publishing-nodejs-packages)

> You can publish Node.js packages to a registry as part of your continuous integration (CI) workflow.

## [Job Container](https://docs.github.com/en/actions/writing-workflows/choosing-where-your-workflow-runs/running-jobs-in-a-container)

> Use a container to run the steps in a job.

```
name: CI
on:
  push:
    branches: [ main ]
jobs:
  container-test-job:
    runs-on: ubuntu-latest
    container:
      image: node:18
      env:
        NODE_ENV: development
      ports:
        - 80
      volumes:
        - my_docker_volume:/volume_mount
      options: --cpus 1
    steps:
      - name: Check for dockerenv file
        run: (ls /.dockerenv && echo Found dockerenv) || (echo No dockerenv)
```


## [Service Containers](https://docs.github.com/en/actions/use-cases-and-examples/using-containerized-services/about-service-containers)

Services run onto of the job-level containers. They cannot be run outside of a job-level container.

> You can use service containers to connect databases, web services, memory caches, and other tools to your workflow.

Example fro GitHub Documentation:
```yaml
name: Redis container example
on: push

jobs:
  # Label of the container job
  container-job:
    # Containers must run in Linux based operating systems
    runs-on: ubuntu-latest
    # Docker Hub image that `container-job` executes in
    container: node:16-bullseye

    # Service containers to run with `container-job`
    services:
      # Label used to access the service container
      redis:
        # Docker Hub image
        image: redis

```