transit_cost %>% 
     filter(!is.na(cost_km_millions)) %>% 
     mutate(country = fct_lump(country, 10)) %>% 
     add_count(country) %>% 
     mutate(country = glue::glue("{ country } ({ n })"), 
            country = fct_reorder(country, cost_km_millions)) %>% 
     ggplot(aes(cost_km_millions, country)) + 
     geom_boxplot() + 
     scale_x_continuous(labels = dollar) + 
     labs(x = "Cost / KM (Millions USD)", y = "")
