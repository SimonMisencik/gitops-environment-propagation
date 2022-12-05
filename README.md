# gitops-environment-propagation

Github action for environment propagation in gitops repository.

Sample repository structure:
``` bash
.
├── environments
│   ├── staging
│   │   ├── app
│   │   │   ├── Chart.yaml
│   │   │   ├── staging-values.yaml
│   │   │   ├── templates
│   │   │   │   ├── sealed-secret.yaml
│   │   │   └── values.yaml
│   │   └── staging-application.yaml
│   └── production
│       ├── app
│       │   ├── Chart.yaml
│       │   ├── production-values.yaml
│       │   ├── templates
│       │   │   ├── sealed-secret.yaml
│       │   └── values.yaml
│       └── production-application.yaml
└── README.md
```

## Inputs

## `source_enviroment`

**Required** Source environment(e.g. `staging`).

## `target_enviroment`

**Required** Target environment(e.g. `production`).

## `prefix_folder`

**Required** Prefix for folder in which environment is stored. Default `environments`.

## `suffix_folder`

**Required** Suffix for folder in which environment is stored. Default `app`.

## `secrets_promotion`

**Required** Option to promote secret. Default `false`.

## Example usage

``` yaml
# Promote a GitOps application from one environment to the next

name: Environment propagation

on:
  workflow_dispatch:
    inputs:
      source_env:
        description: 'Source environment'
        required: true
        default: 'staging' 
        type: choice
        options:
        - staging
        - production
      target_env:
        description: 'Target environment'
        required: true
        default: 'production' 
        type: choice
        options:
        - staging
        - production

jobs:
  promote:
    runs-on: ubuntu-latest
    name: Propagate changes
    steps:
      - uses: actions/checkout@v3
      - name: Propagate changes and create PR
        id: hello
        uses: simonmisencik/gitops-environment-propagation@main
        with:
          source_enviroment: 'staging'
          target_enviroment: 'production'
          prefix_folder: 'environments'
          suffix_folder: 'app'

```
## Dependency

- [create-pull-request](https://github.com/peter-evans/create-pull-request)

## Contributions

Whether it is a small documentation correction, bug fix or new features, contributions are highly appreciated.
