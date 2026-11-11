
# sales_analysis.R
# Purpose: Analyze synthetic sales data by product category.

# Install packages once if needed:
# install.packages(c("dplyr", "ggplot2"))

library(dplyr)
library(ggplot2)

# Create synthetic sales data
sales <- data.frame(
  order_id = 1:12,
  category = rep(c("Books", "Home", "Technology"), each = 4),
  units = c(2, 1, 3, 2, 1, 2, 1, 3, 1, 2, 2, 1),
  unit_price = c(15, 20, 12, 18, 40, 35, 50, 30, 250, 180, 220, 300)
)

# Calculate sales summary
sales_summary <- sales %>%
  group_by(category) %>%
  summarise(
    total_units = sum(units),
    total_sales = sum(units * unit_price),
    average_order_value = mean(units * unit_price),
    .groups = "drop"
  )

# Display results
print(sales_summary)

# Create sales chart
sales_plot <- ggplot(sales_summary,
                     aes(x = category, y = total_sales)) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Total Synthetic Sales by Category",
    x = "Product Category",
    y = "Total Sales"
  ) +
  theme_minimal()

print(sales_plot)
