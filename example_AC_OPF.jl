using PowerModels
using Ipopt

function example_AC_OPF(network, optimizer) 
    solution = solve_ac_opf(network, optimizer)
    return solution

end

# Run the function


