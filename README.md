# Dependencies

## Motivation

Every change inside a mkderivation triggers a rebuild. This leads to unneccessary rebuilds when there is a change of input that does not require a rebuild. In some cases this really hurts development speed.

To structure a package build more incremental we can split that mkderivation into multiple. For example one for the build, one for tests, one for documentation and ... one for run time dependencies as used in python (the runtime libraries do not change the build of a python package in most cases.).

## Multi Package Solution

This can be found in packages/multi/default.nix

### Caveats

For the runtime dependencies we build a package from an mkderivation where actually only would need a list to search through recursivly

## Passthru Solution

Luckily there as an alternative to a file with multiple packages inside: A package with anything inside that does in turn not affect the package. Precisly what we were looking for. We even can access the passthru content without building the main mkderivation.

Feel free to have a look at packages/passthru/default.nix

One neat trick to get this working is `finalAttrs`. This way we can access parts of the mkderivation from inside passthru. One should avoid adding passthru to the main mkderivation for this invalidates the whole point.

