*** Replication for the "Trump Won, Biden Cheated" article
*** Created on July 17, 2025 by Yun Lu

*************Variables**********************
*user_support: the NUMBER of Twitter users who support election conspiracy theories
*county: county name
*state: state name
*stcode: state id
*county_pop: county population size
*white: % non-hispanic whites
*college: % college graduates
*unemployment: unemployment rate in Feb 2020
*rural_urban_continuum_code_2013: rural and urban code
*trump_voter: % Trump voters in 2020 presidential election
*gini: Gini coefficient in 2019
*workplaces_change: changes in visits to workplaces  during  COVID-19 pandemic
*user_sampled: the RATE of Twitter user based on 1% sample of real-time tweets, that is the raw count divided by county population size
*user_not_support: the RATE of Twitter users who oppose election conspiracy theories or reveal no clear stance, that is the raw count divided by county population size
*loginfection: the COVID-19 infection rate, logged
*logincome: the median household income, logged
*unemployment_change: changes in unemployment rate during early COVID-19 pandemic
*republican_gov: republican governor

*************Commands**********************
*Model 1 in Table 2
menbreg user_support    c.gini c.unemployment_change  ///
         user_sampled  user_not_support     ///
	     trump_voter      republican_gov     ///
         loginfection    workplaces_change     ///
	     logincome  unemployment   college  ///
	     rural_urban_continuum_code_2013    ///
		 white, exposure(county_pop)   ||stcode:   

*Model 2 in Table 2		 
menbreg user_support    c.gini##c.unemployment_change  ///
         user_sampled  user_not_support   ///
	     trump_voter      republican_gov     ///
         loginfection    workplaces_change    ///
	     logincome  unemployment   college ///
	     rural_urban_continuum_code_2013   ///
		 white, exposure(county_pop)     ||stcode:   

*Figure 2
quietly margins, at(gini =(.35(.05).6) unemployment_change=(.786  2.421)) atmeans
marginsplot

