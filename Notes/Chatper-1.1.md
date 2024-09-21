# Chapter 1.1 GitHub Actions Learning Continued 

## Matrix Strategies 

Use a variable to allow running a job on multiple oses 

```yaml
jobs:
  example_matrix:
    strategy:
      matrix:
        version: [10, 12, 14]
        os: [ubuntu-latest, windows-latest]
```

The keys under Matrix are use created. Refer to them with `${{ matrix.version }}`.

- `fail-fast`: Default behavior is any step in the matrix fails, then all other runs in the matrix fail.Change this by setting `fail-fast` to false in the strategy. 
- `max-parallel`: Sets the maximum jobs to process at a time

### Include/Exclude for Part of the Matrix 

```yaml
    deploy:
        strategy: 
            matrix: 
              os: [ubuntu-latest, ubuntu-20.04, windows-latest]
              images: [hellow-world, alpine]
              # Exclude alpine image from windows 
              exclude: 
                - images: alpine 
                  os: windows 
              # includes amd64/alpine image on ubuntu-latest
              include:
                - images: amd64/alpine
                  os: ubuntu-latest                  
```

## [Contexts](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/accessing-contextual-information-about-workflow-runs) 

> Contexts are a way to access information about workflow runs, variables, runner environments, jobs, and steps. Each context is an object that contains properties, which can be strings or other objects. 

