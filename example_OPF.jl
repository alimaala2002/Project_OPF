using PowerModels
using Ipopt

function example_OPF() 
    solution = solve_ac_opf("case3.m", Ipopt.Optimizer)

    return solution

end



