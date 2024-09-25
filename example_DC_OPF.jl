using PowerModels
using Ipopt

function example_DC_OPF() 
    solution = solve_dc_opf("case3.m", Ipopt.Optimizer)

    return solution

end

# Run the function