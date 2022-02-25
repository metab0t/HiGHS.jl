module HiGHS

import HiGHS_jll
import MathOptInterface
import SparseArrays

function __init__()
    global libhighs = HiGHS_jll.libhighs
    return
end

include("gen/libhighs.jl")
include("MOI_wrapper.jl")

# HiGHS exports all `Highs_xxx` symbols. If you don't want all of these symbols
# in your environment, then use `import HiGHS` instead of `using HiGHS`.

for sym in names(@__MODULE__, all = true)
    if startswith("$sym", "Highs_") || startswith("$sym", "kHighs")
        @eval export $sym
    end
end

end # module HiGHS
