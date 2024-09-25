using PowerModels
using Ipopt

function example_AC_OPF() 
    solution = solve_ac_opf("case3.m", Ipopt.Optimizer)

    return solution

end

# Run the function


