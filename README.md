# Athletes per country in the 2025 Track and Field World Championship Tokyo

## Objective

I got myself interested in the number of athletes each country has sent to the
Track and Field World Championship in Tokyo 2025. In particular I wanted to set
the number of athletes in proportion to the countries' sizes.

## Data sources

I got my data from these sources:

- Athletes participating in the championship:
  [Track And Field World Championships Tokyo 2025 Full Entry List](https://www.flotrack.org/articles/14526982-track-and-field-world-championships-tokyo-2025-full-entry-list)
  
- Population of each country:
  [Worldbank - Population, total](https://data.worldbank.org/indicator/SP.POP.TOTL)
  
## Comments

To join the data of the two sources, I had to convert the IOC country code to
the ISO3c code. However, some regions like Gibraltar are no countries. As these
regions are small, I decided to ignore them.