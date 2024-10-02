using PowerModels
using Ipopt
using DataFrames
using CSV
includet("general_case.jl")

function dataframe_time()
    df = DataFrame(case_name = ["case3_lmbd.m", "case30_ieee.m", "case179_goc.m", "case1888_rte.m", 
    "case2869_pegase.m", "case6515_rte.m"], nodes = [3, 30, 179, 1888, 2869, 6515], branches = [3, 41, 263, 2531, 4582, 9037],
    ACP_time = [general_case("pglib_opf_case3_lmbd.m", ACPPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case30_ieee.m", ACPPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case179_goc.m", ACPPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case1888_rte.m", ACPPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case2869_pegase.m", ACPPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case6515_rte.m", ACPPowerModel, Ipopt.Optimizer)["solve_time"]],
    DCP_time = [general_case("pglib_opf_case3_lmbd.m", DCPPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case30_ieee.m", DCPPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case179_goc.m", DCPPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case1888_rte.m", DCPPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case2869_pegase.m", DCPPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case6515_rte.m", DCPPowerModel, Ipopt.Optimizer)["solve_time"]], 
    QCRM_time = [general_case("pglib_opf_case3_lmbd.m", QCRMPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case30_ieee.m", QCRMPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case179_goc.m", QCRMPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case1888_rte.m", QCRMPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case2869_pegase.m", QCRMPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case6515_rte.m", QCRMPowerModel, Ipopt.Optimizer)["solve_time"]], 
    QCLS_time = [general_case("pglib_opf_case3_lmbd.m", QCLSPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case30_ieee.m", QCLSPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case179_goc.m", QCLSPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case1888_rte.m", QCLSPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case2869_pegase.m", QCLSPowerModel, Ipopt.Optimizer)["solve_time"], 
    general_case("pglib_opf_case6515_rte.m", QCLSPowerModel, Ipopt.Optimizer)["solve_time"]])

    df.ACP_time = round.(df.ACP_time, digits = 2)
    df.DCP_time = round.(df.DCP_time, digits = 2)
    df.QCRM_time = round.(df.QCRM_time, digits = 2)
    df.QCLS_time = round.(df.QCLS_time, digits = 2)

    CSV.write("benchmarking_time.csv", df)

    return df
end
