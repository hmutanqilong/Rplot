x <- as.matrix(eurodist)

countries <- c("Greece", "Spain", "Belgium", "France", "France",
               "Germany", "Denmark", "Switzerland", "Gibraltar", "Germany",
               "Holland", "Portugal", "France", "Spain", "France", "Italy",
               "Germany", "France", "Italy", "Sweden", "Austria")



f.countries <- factor(countries)
group.colors <- heat.colors(nlevels(f.countries))
country.color <- group.colors[as.integer(f.countries)]

group.colors <- gray(seq(0, nlevels(f.countries))/nlevels(f.countries))
country.color <- group.colors[as.integer(f.countries)]



heatmap(x,ColSideColors = country.color,
        RowSideColors = country.color
)