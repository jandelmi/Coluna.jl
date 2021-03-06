# Coluna.jl

[![Documentation](https://img.shields.io/badge/docs-latest-blue.svg)](https://atoptima.github.io/Coluna.jl/latest)
[![Build Status](https://travis-ci.org/atoptima/Coluna.jl.svg?branch=master)](https://travis-ci.org/atoptima/Coluna.jl)
[![codecov](https://codecov.io/gh/atoptima/Coluna.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/atoptima/Coluna.jl)
[![Discord](https://img.shields.io/discord/651851215264808971?logo=discord)](https://discord.gg/cg77wFW)
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![License: MPL 2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)


`Coluna` is a branch-and-price-and-cut framework that decomposes and solves 
a mixed-integer program (MIP). The user introduces his "original" problem formulation using the [`JuMP`](https://github.com/JuliaOpt/JuMP.jl) modeling language and our specific extension
[`BlockDecomposition`](https://github.com/atoptima/BlockDecomposition.jl). 

`Coluna` reformulates the user problem based on the "annotations" provided along side the original formulation using `BlockDecomposition`.

`Coluna` aims to be very modular and tweakable so that any user can define the behavior of his customized branch-and-price-and-cut algorithm. The user can create its own algorithmic strategy using the algorithmic building blocks offered in `Coluna`.

## Installation

You can install Coluna.jl through the package manager of Julia. 

```
   ] add Coluna
```

## Features

We aim to integrate to Coluna the state-of-the-art techniques used for 
branch-and-cut-and-price algorithms.

As functionality goes, we aim to provide the support for:

- [x] Dantzig-Wolfe decomposition 
- [ ] Benders decomposition
- [ ] Mixed Dantzig-Benders decomposition
- [ ] Nested/Recursive decomposition
- [x] Column generation
- [ ] Cuts generation
- [x] Branch-and-price-and-cut customization
- [ ] Ad-hoc customised oracles for solving subproblems / separation routines
- [ ] Preprocessing specific to reformulated problems / cleaning up of large scale formulations 
- [ ] Stabilisation and other convergence speed-up methods
- [ ] Strong-branching 
- [ ] Parallelisation of the Branch-and-Bound Tree Search 

## Authors

The current main contributors to Coluna.jl are Cristiana Bentes, Teobaldo Bulhões, Guillaume Marques, Vitor Nesello, Artur Alves Pessoa, Ruslan Sadykov, Anand Subramanian, Eduardo Uchoa, and François Vanderbeck.

## Sponsor

The plateform development has received an important support grant from the international scientific society [**Mathematical Optimization Society' (MOS)**](http://www.mathopt.org/)

## Contributing

- Choose an issue and open a PR with a proposition to fix it.
- Open new issues if you find a bug or a way to enhance the package.
