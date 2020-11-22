function weights(nodes)
# Eingabe:
#   - nodes: Stuetzstellen des Interpolationspolynoms
# Ausgabe:
#   - w:  baryzentrische Gewichte

# straight forward; geht bestimmt effizienter
    w = ones(length(nodes),1);
    for j in 1:length(nodes)
        for i in 1:length(nodes)
            if i != j
                w[j] = w[j] * (nodes[j] - nodes[i])^(-1);
            end
        end
    end
return w;
end
