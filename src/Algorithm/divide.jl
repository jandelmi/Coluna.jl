using ..Coluna # to remove when merging to the master branch

"""
    DivideInput

    Input of a divide algorithm used by the tree search algorithm.
    Should contain the parent node and the current best
"""
struct DivideInput <: AbstractInput
    parent::Node
    ip_primal_bound::PrimalBound
end

getparent(input::DivideInput) = input.parent
get_ip_primal_bound(input::DivideInput) = input.ip_primal_bound

"""
    DivideOutput

    Output of a divide algorithm used by the tree search algorithm.
    Should contain the vector of generated nodes.
"""
struct DivideOutput <: AbstractOutput 
    children::Vector{Node}
    result::OptimizationResult
end

getchildren(output::DivideOutput)::Vector{Node} = output.children
getresult(output::DivideOutput)::OptimizationResult = output.result

"""
    AbstractDivideAlgorithm

    This algoirthm type is used by the tree search algorithm to generate nodes.
"""
abstract type AbstractDivideAlgorithm <: AbstractAlgorithm end

function run!(algo::AbstractDivideAlgorithm, reform::Reformulation, input::DivideInput)::DivideOutput
    algotype = typeof(algo)
    error("Method run! which takes Reformulation and DivideInput as parameters and returns DivideOutput 
           is not implemented for algorithm $algotype.")
end    