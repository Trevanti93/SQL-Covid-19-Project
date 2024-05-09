# SQL-Tableau COVID-19 Project


### Project Overview
 This project has given me the opportunity to gain more insights on how Covid-19 has impacted other countries around the world. The main focus of this analysis was to take a deeper look into vaccination administration, deaths rates, and infection rates on a global level. Conducting this exploratory analysis definitely has opened up my eyes to the various health disparities and challenges in other countries.

 ### Dataset
 The data compilation period is January 2020-  Early May 2023. The Covid-19 dataset contains 1M+ rows of records containing various elements related to infections, deaths, vaccinations,  hospital admissions , and various demographic information. The data set utilized for this project can be found in the following link below.

COVID-19 Dataset [DOWNLOAD HERE](https://ourworldindata.org/covid-deaths)

### Tools
- MySQL -Data Analysis/Exploration
- Tableau -Creating Visualizations/Dashboard [ACCESS DASHBOARD HERE](https://public.tableau.com/app/profile/trevanti.whtifield/viz/Covid-19Dashboard_17151999577630/CovidDashboard1)


### Insights: Exploring Data Using Tableau Dashboard
Approximately 765 Million people contracted Coronavirus from within the date range January 2020- Early May 2023. Almost 1% of the COVID case population died. 

![Total Deaths vs Cases](https://github.com/Trevanti93/SQL-Covid-19-Project/assets/168140047/74282505-259c-43f2-b334-a31b4a65e1ed)


The bar graph located on the top half of the dashboard shows that Europe had the most COVID deaths equating to about 2.05M followed by Asia equating to about 1.63M deaths.

![Deaths By Continent](https://github.com/Trevanti93/SQL-Covid-19-Project/assets/168140047/b1bd771f-f0ca-4517-a0db-e67ae5745d42)


 The world map Tableau visualization shows the percentage of each countries’ population that contracted Covid. The European regions seem to have the highest prevalence of Covid cases based on the population. Cyprus, Austria, Slovenia, and San Marino are amongst countries in which over 60% of their population contracted Coronavirus. 

 ![Global Covid Map](https://github.com/Trevanti93/SQL-Covid-19-Project/assets/168140047/ec00d29c-7bb0-4a00-a02c-7c10b7119f63)


However, the tree map at the bottom right side of the dashboard shows the United States, China, and India had the highest number of reported covid cases. The United States reported the most covid cases equating to over 103 million cases followed by China who had reported over 99 million cases. India reported the third most cases equating to approximately 45 million. 

![High COVID Cases](https://github.com/Trevanti93/SQL-Covid-19-Project/assets/168140047/0ae663af-1aed-4c50-bba7-c0209d28a9cc)


Although the United States, China, and India had the highest number of covid cases, none of them ranked among the top 10 countries with the highest case fatality rates. I found it very interesting that none of the countries in the tree map were ranked among the top 10 countries with the highest case fatality rates. The case fatality rate chart in the dashboard shows that Yemen exhibited the highest case fatality rate amongst all countries with approximately 18.00% of cases resulting in death followed by Sudan and Syria.

![Case Fatality %](https://github.com/Trevanti93/SQL-Covid-19-Project/assets/168140047/cbded584-cbbd-4bbc-849f-134c8e8c8741)


The combo chart located on the bottom left side of the dashboard tracks the number of Covid deaths and cases over a span of three years. By filtering the data to a specific year you can see that January and December are peak months for Covid cases and deaths. The rapid spreading of the cold, flu, and different new strains of the virus are the most likely culprits of Covid cases and deaths spiking in December through January.

Cases vs Deaths 2020

![Cases vs Deaths 2020](https://github.com/Trevanti93/SQL-Covid-19-Project/assets/168140047/db1d7e04-64bb-452e-a7a7-7de673651458)

Cases vs Deaths 2021

![Cases vs Deaths 2021](https://github.com/Trevanti93/SQL-Covid-19-Project/assets/168140047/017398a9-d3f0-4cad-9c7f-3147ac6eaa24)

Cases vs Deaths 2022

![Cases vs Deaths 2022](https://github.com/Trevanti93/SQL-Covid-19-Project/assets/168140047/49a04851-a955-4b41-98e6-c05572db9c95)


Cases vs Deaths 2023

![Cases vs Deaths 2023](https://github.com/Trevanti93/SQL-Covid-19-Project/assets/168140047/62085165-defc-4fc5-8da7-12622727588f)


### Additional Analysis (SQL Queries)
Health disparities are apparent around the globe. I wanted to take a deeper dive into vaccine administration and determine which countries were vaccinated the least relative to their population. Burundi, Africa had the lowest vaccination rate in the world relative to their population. Six out of the Ten countries that had the lowest vaccination rates relative to their population was located in Africa. 

Countries with lowest vaccination rates relative to population

![Vaccinated Population](https://github.com/Trevanti93/SQL-Covid-19-Project/assets/168140047/564a6b1c-5dc5-4208-a70c-a03240c464b5)


I took the analysis a step further by determining which countries were vaccinated the least relative to their total covid case count (case vaccination rate). The top 10 countries with the lowest vaccination rates relative to the case count were all located in Africa with the exception of Nicaragua.  Chad had the lowest case vaccination rate equating to 0.0011% followed by Tanzania (0.0014%), and Niger(0.0036%) respectively. 

Case Vaccination Rates

![Case Vaccination Rates](https://github.com/Trevanti93/SQL-Covid-19-Project/assets/168140047/07dce595-0de0-4a6e-bbc9-1638372d28a2)


Even though African countries had a significant amount of people vaccinated, their case vaccination rates were still extremely low compared to other countries. The case vaccination rates are very low in some regions of Africa compared to other countries. This is most likely because people in these regions are less able to get tested and vaccinated due to the lack of access to healthcare. 



### Conclusion
Conducting this analysis enabled me to see how COVID impacted various countries differently. The analysis shows that some countries have a high volume of COVID cases, but a lower amount of cases relative to their population. On the contrary, some countries have a low volume of COVID cases, but have a high amount of cases relative to their population. This project also highlights how some regions of the world have more prevalence of health disparities.  

Some countries have higher case fatality rates than countries with a higher number of total cases. The analysis also shows that some regions have a low case vaccination rate compared to other regions around the globe. As mentioned earlier, these health disparities are most likely due to the lack of access to care. Furthermore, my hope for our society is that everyone has equal access to care. I definitely appreciate the opportunity to analyze and explore the data provided by Our World in Data. I am looking forward to creating more projects that will dive into various health care topics/challenges in order to provide insights and solutions.

