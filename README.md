# gitops-environment-propagation

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

## `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

## `time`

The time we greeted you.

## Example usage

uses: simonmisencik/gitops-environment-propagation@v2
with:
  who-to-greet: 'Mona the Octocat'