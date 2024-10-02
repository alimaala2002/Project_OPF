using PowerModels
using Ipopt
using DataFrames
using CSV
includet("general_case.jl")

function dataframe_objective()
    df = DataFrame(case_name = ["case3_lmbd.m", "case30_ieee.m", "case179_goc.m", "case1888_rte.m", 
    "case2869_pegase.m", "case6515_rte.m"], nodes = [3, 30, 179, 1888, 2869, 6515], branches = [3, 41, 263, 2531, 4582, 9037],
    ACP_objective = [general_case("pglib_opf_case3_lmbd.m", ACPPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case30_ieee.m", ACPPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case179_goc.m", ACPPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case1888_rte.m", ACPPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case2869_pegase.m", ACPPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case6515_rte.m", ACPPowerModel, Ipopt.Optimizer)["objective"]],
    DCP_objective = [general_case("pglib_opf_case3_lmbd.m", DCPPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case30_ieee.m", DCPPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case179_goc.m", DCPPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case1888_rte.m", DCPPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case2869_pegase.m", DCPPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case6515_rte.m", DCPPowerModel, Ipopt.Optimizer)["objective"]], 
    QCRM_objective = [general_case("pglib_opf_case3_lmbd.m", QCRMPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case30_ieee.m", QCRMPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case179_goc.m", QCRMPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case1888_rte.m", QCRMPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case2869_pegase.m", QCRMPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case6515_rte.m", QCRMPowerModel, Ipopt.Optimizer)["objective"]], 
    QCLS_objective = [general_case("pglib_opf_case3_lmbd.m", QCLSPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case30_ieee.m", QCLSPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case179_goc.m", QCLSPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case1888_rte.m", QCLSPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case2869_pegase.m", QCLSPowerModel, Ipopt.Optimizer)["objective"], 
    general_case("pglib_opf_case6515_rte.m", QCLSPowerModel, Ipopt.Optimizer)["objective"]])

    df.ACP_objective = round.(df.ACP_objective, digits = 2)
    df.DCP_objective = round.(df.DCP_objective, digits = 2)
    df.QCRM_objective = round.(df.QCRM_objective, digits = 2)
    df.QCLS_objective = round.(df.QCLS_objective, digits = 2)

    CSV.write("benchmarking_objective.csv", df)
    
    return df
end