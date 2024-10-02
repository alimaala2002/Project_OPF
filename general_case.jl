using PowerModels
using Ipopt

function general_case(network, formulation, optimizer)
    solution = solve_opf(network, formulation, optimizer)
    return solution
    
end