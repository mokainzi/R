# load tidyverse library
library(tidyverse)

# load observations.xlsx
library(readxl)
url <- "https://github.com/mokainzi/R/blob/master/unicorns_on_unicycles/observations.xlsx?raw=true"
destfile <- "observations.xlsx"
curl::curl_download(url, destfile)
observations <- read_excel(destfile)
View(observations)

# load sales.xlsx
library(readxl)
url <- "https://github.com/mokainzi/R/blob/master/unicorns_on_unicycles/sales.xlsx?raw=true"
destfile <- "sales.xlsx"
curl::curl_download(url, destfile)
sales <- read_excel(destfile)
View(sales)


# rename observations country variable
names(observations) [1] <- "country"
View(observations)

# separate sales into two objects, rename variables and 
# transform country values to lowercase
sales_bikes <- sales[, 1:3]
names(sales_bikes) <- c("country", "year", "bikes")
sales_bikes$country <- str_to_title(sales_bikes$country)
View(sales_bikes)

sales_total_turnover <- sales[, 6:8]
names(sales_total_turnover) <- c("country", "year", "total_turnover")
sales_total_turnover$country <- str_to_title(sales_total_turnover$country)
View(sales_total_turnover)


# full-join observations, sales_bikes and sales_total_turnover by country and year
df <- observations %>%
  full_join(sales_bikes, by = c("country", "year")) %>%
  full_join(sales_total_turnover, by = c("country", "year"))
View(df)

# bar chart of average bike prices across European countries
df %>%
  mutate(bike_price = total_turnover/bikes) %>%
  group_by(country) %>%
  summarise(bike_price = mean(bike_price)) %>%
  ggplot(aes(x = country, y = bike_price, fill = bike_price)) + 
  geom_col()

# plot to visualize the relation between unicorns and unicycles
df %>%
  ggplot(aes(x = pop, y = bikes, group = country, color = country)) +
  geom_point() +
  labs(
    title = "Unicorns Vs. Unicycle Sales",
    subtitle = "The more unicorns exist the more unicycles are soled in\nthe 17th century in western Europe",
    x = "Unicorns",
    y = "Unicycle Sales",
    color = "Country"
  ) + 
  theme_bw()
