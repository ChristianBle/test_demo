function evalPol(x, nodes, fj)
# Eingaben:
#   - x:  Auswertungsstelle
#   - nodes: Vektor mit Stuetzstellen
#   - fj: Vektor mit Funktionswerten an Stuetzstellen nodes
# Ausgabe:
#   - p_N: Auswertung des Interpolationspolynoms an der Stelle x


if in(x, nodes)
    # falls x Stuetzstelle ist, finde entsprechenden Index
    idx = findfirst(s -> s==x, nodes);
    # Auswertung des Polynoms ist dann gleich entpsrechendem Funktionswert
    p_N = fj[idx]
else
    # erzeuge baryzentrische Gewichte
    w = weights(nodes);

    # bestimme Summanden des Zaehlers und des Nenners
    d = w./(x .- nodes);
    n = fj.*d;

    # bestimme Zaehler und Nenner
    d = sum(d);
    n = sum(n);

    # Auswertung Polynom via (2)
    p_N = n/d;
end

return p_N;

end

####################### TEST: INTERPOLATION #######################
# using Plots
#
# nodes = 0:.5:4;
# f(x) = sin.(x);
# x_eval = 0:.1:4;
#
# fj = f(nodes)
# f_ex = f(x_eval);
# p = zeros(length(x_eval),1);
# for i in 1:length(x_eval)
#     p[i] = evalPol(x_eval[i], nodes, fj);
# end
#
# plot(x_eval, f_ex);
# plot!(x_eval, p);
