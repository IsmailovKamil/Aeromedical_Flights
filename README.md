# Air Medical Service Flights Analysis - Capstone Project
---
## Problem Context:
**Domain:** Air Medical Services and Health Care\
**End - Users:** Aeromedical Service Providers and the Federal Government\
**Importance of problem:** 
- Aeromedical flights play a crucial role in offering services to the rural areas that lack healthcare benefits.
- Hospitals operating in cities are vital to the quality of life and economy of communities throughout the region.

## Problem Statement: 
- The accessibility to health and medical services for rural residents is reduced. 
- The project aims to provide insights on the operations of current aeromedical services and predict flight demand for the next few days.

## FW/RW
FW and RW folders contain datasets, scripts, images, and Tableau dashboards.

Script description in "Script" folder of RW/FW:  
1. FW/RW_airports_merging: merging process of the airport information using several approaches. Different combinations of information about airport codes, airport name, city, and state were used as a primary key for joining. The outcome is a joined information about the airport code, city, state, and country for each record. 
2. FW/RW METAR data merging: merging process of the meteorological data (METAR) to the dataset with airport information using airport code, date, and time as a merging key. 
3. FW/RW_anomaly: Outlier classification(Yes/No) of duration and distance of flights based on the boxplot approach. 
4. FW/RW_ARIMA: building of an ARIMA model to predict the number of flights for each day.
5. FW/RW Tracker: creating a dataset for the tracking system in a Tableau.
6. FW/RW_IHC: subsetting and cleaning the dataset which contains information only about the "Intermountain Healthcare" service. Flights analysis of the "Intermountain Healthcare."  
7. Merging of additional airport information for the "ILS" and "LPVorPV" analysis. Hypothesis testing of "ILS" and "LPVorPV."
8. FW/RW cluster analysis: K-means cluster analysis of the flights.
