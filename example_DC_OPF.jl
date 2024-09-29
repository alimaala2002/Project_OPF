using PowerModels
using Ipopt

function example_DC_OPF(network, optimizer) 
    solution = solve_dc_opf(network, optimizer)
    return solution

end

# Run the function

