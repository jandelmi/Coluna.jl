function incumbents_unit_tests()
    incumbents_getters_and_setters_unit_tests()
end

function incumbents_getters_and_setters_unit_tests()
    inc = ClF.Incumbents(ClF.MinSense)
    max_inc = ClF.Incumbents(ClF.MaxSense)

    @test ClF.getsense(inc) == ClF.MinSense
    @test ClF.getsense(max_inc) == ClF.MaxSense

    f = ClF.Formulation{ClF.Original}(ClF.Counter(), obj_sense = ClF.MinSense)

    var_ids = [ClF.Id{ClF.Variable}(i, 1) for i in 1:5]
    constr_ids = [ClF.Id{ClF.Constraint}(i, 1) for i in 1:5]

    bound = ClF.PrimalBound{ClF.MinSense}(8.1)
    sol_varids = [var_ids[1], var_ids[3]]
    sol_vals = [2.1, 1.4]
    lp_primal_sol = ClF.PrimalSolution(f, sol_varids, sol_vals, bound)

    @test ClF.update_lp_primal_sol!(inc, lp_primal_sol)
    @test ClF.get_lp_primal_sol(inc) == lp_primal_sol
    @test ClF.get_lp_primal_bound(inc) == 8.1

    bound = ClF.PrimalBound{ClF.MinSense}(9.6)
    sol_varids = [var_ids[2]]
    sol_vals = [3.5]
    lp_primal_sol = ClF.PrimalSolution(f, sol_varids, sol_vals, bound)
    @test !ClF.update_lp_primal_sol!(inc, lp_primal_sol)
    @test ClF.get_lp_primal_bound(inc) == 8.1

    bound = ClF.PrimalBound{ClF.MinSense}(12.0)
    sol_varids = [var_ids[3], var_ids[4]]
    sol_vals = [2.0, 1.0]
    ip_primal_sol = ClF.PrimalSolution(f, sol_varids, sol_vals, bound)
    @test ClF.update_ip_primal_sol!(inc, ip_primal_sol)
    @test ClF.get_ip_primal_sol(inc) == ip_primal_sol
    @test ClF.get_ip_primal_bound(inc) == 12.0

    bound = ClF.DualBound{ClF.MinSense}(1.1)
    sol_constrids = [constr_ids[3], constr_ids[5]]
    sol_vals = [0.1, 0.9]
    lp_dual_sol = ClF.DualSolution(f, sol_constrids, sol_vals, bound)
    @test ClF.update_lp_dual_sol!(inc, lp_dual_sol)
    @test ClF.get_lp_dual_sol(inc) == lp_dual_sol
    @test ClF.get_lp_dual_bound(inc) == 1.1

    bound = ClF.DualBound{ClF.MinSense}(2.0)
    @test ClF.update_ip_dual_bound!(inc, bound)
    @test ClF.get_ip_dual_bound(inc) == 2.0

    @test ClF.ip_gap(inc) == (12.0 - 2.0) / 2.0
    @test ClF.lp_gap(inc) == (8.1 - 1.1) / 1.1
end
