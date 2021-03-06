# This interface must be implemented by all modules that want to use containers
# provided by Containers.

abstract type AbstractSense end
abstract type AbstractMinSense <: AbstractSense end
abstract type AbstractMaxSense <: AbstractSense end

abstract type AbstractSpace end
abstract type AbstractPrimalSpace <: AbstractSpace end
abstract type AbstractDualSpace <: AbstractSpace end
