# Problem E: How does climate change influence regional instability?
The effects of Climate Change, to include increased droughts, shrinking glaciers, changing animal and plant ranges, and sea level rise, are already being realized and vary from region to region. The Intergovernmental Panel on Climate Change suggests that the net damage costs of climate change are likely to be significant. Many of these effects will alter the way humans live, and may have the potential to cause the weakening and breakdown of social and governmental structures. Consequently, destabilized governments could result in fragile states.  

A fragile state is one where the state government is not able to, or chooses not to, provide the basic essentials to its people. 
For the purpose of this problem “state” refers to a sovereign state or country. 
Being a fragile state increases the vulnerability of a country’s population to the impact of such climate shocks as natural disasters, decreasing arable land, unpredictable weather, and increasing temperatures. 
Non-sustainable environmental practices, migration, and resource shortages, which are common in developing states, may further aggravate states with weak governance (Schwartz and Randall, 2003; Theisen, Gleditsch, and Buhaug, 2013). Arguably, drought in both Syria and Yemen further exacerbated already fragile states. Environmental stress alone does not necessarily trigger violent conflict, but evidence suggests that it enables violent conflict when it combines with weak governance and social fragmentation. This confluence can enhance a spiral of violence, typically along latent ethnic and political divisions (Krakowka, Heimel, and Galgano 2012).  

__Your tasks__ are the following:  
Task 1: Develop a model that determines a country’s fragility and simultaneously measures the impact of climate change. Your model should identify when a state is fragile, vulnerable, or stable. It should also identify how climate change increases fragility through direct means or indirectly as it influences other factors and indicators.  
Task 2: Select one of the top 10 most fragile states as determined by the [Fragile State Index](http://fundforpeace.org/fsi/data/) and determine how climate change may have increased fragility of that country. Use your model to show in what way(s) the state may be less fragile without these effects.  
Task 3: Use your model on another state not in the top 10 list to measure its fragility, and see in what way and when climate change may push it to become more fragile. Identify any definitive indicators. How do you define a tipping point and predict when a country may reach it?  
Task 4: Use your model to show which state driven interventions could mitigate the risk of climate change and prevent a country from becoming a fragile state. Explain the effect of human intervention and predict the total cost of intervention for this country.  
Task 5: Will your model work on smaller “states” (such as cities) or larger “states” (such as continents)? If not, how would you modify your model?  
__Your submission__ should consist of:  
* One-page Summary Sheet  
* Your solution of no more than 20 pages, for a maximum of 21 pages with your summary.  
* Note: Reference list and any appendices do not count toward the 21-page limit and should appear after your completed solution.  
## References:
* Krakowka, A.R., Heimel, N., and Galgano, F. "Modeling Environmenal Security in Sub-Sharan Africa – ProQuest." The Geographical Bulletin, 2012, 53 (1): 21-38.  
* Schwartz, P. and Randall, D. "An Abrupt Climate Change Scenario and Its Implications for United States National Security", October 2003. <http://eesc.columbia.edu/courses/v1003/readings/Pentagon.pdf>  
* Theisen, O.M., Gleditsch, N.P., and Buhaug, H. "Is climate change a driver of armed conflict?" Climate Change, April 2013, V117 (3), 613-625.  
***

# Summary of Our Solution
After ’911’ attacks, fragile states capture the attention of western countries rapidly,
but most of related evaluation systems do not take climate into account. In this paper,
we consider the impact of climate change on fragility and propose Climate-based Fragile
State Index (CFSI).  

First, primary indicators are set as: Politics, Society, Economy and Climate with 16
secondary indicators. Entropy-weight method is used to determine the weights of indicators
based on data about 145 countries. A gravity-like model is designed to quantify
the mutual impact among indicators. Weighted value is mapped to vector in 4-D space.
The length of normalized vector projection on standard vector is defined as VCFSI , the
angle of vector repesents the potential of state’s fragility. K-means algorithm is used
to cluster 145 countries into 4 categories, and VCFSI of 4 cluster centers are set as the
threshold for 5 different fragility levels.  

For clear visualization, colormap and projection are used to describe the impact of indicators
change, especially climate-related ones. Based on the simulation of the fragility
in South Sudan under different climate conditions, pratical proposals are designed to
defend climate risks. The fragility of Egypt from 2018 to 2021 is predicted by Auto Regressive
and Denial testing. Based on this prediction model, we discuss how climate
changes lead to higher fragility. The result shows Egyptian fragility reached ’Extremely
Fragile’ and ’Vulnerable’ in 2015 and 2017 respectively, and it probably stablizes in the
near future.  

Further, State Driven Intervention Model is built based on Bi-level Programming.
The goal of upper level is to minimize fragility including climate risks, and the goals
of two lower levels are to maximize economic development and to minimize social individuals’s
adverse influence. Suggestions of interventions and total cost are provided
based on the distribution of optimal solution in two levels.  

Finally, performance of our model is analysed on different sizes of ’state’. City modeling
suffers from insufficient data, specific features in different cities. Continent modeling
suffers from few indicators. Further, sugguestions aimed at the aforementioned
problems are provided as our future work.  

__CFSI: Climate-based Fragile State Index__

Evaluation system of CFSI:  
<img src="https://github.com/ChaofanTao/MCM/blob/master/2018-COMAP/files/evaluationsystem.png" width = "800" height = "300" alt="feature" />  

Top 10 most fragile states of CFSI and Influences of climate on other indicators: :  
<img src="https://github.com/ChaofanTao/MCM/blob/master/2018-COMAP/files/top10.png" width = "420" height = "270" alt="top10" />
<img src="https://github.com/ChaofanTao/MCM/blob/master/2018-COMAP/files/index.png" width = "420" height = "270" alt="influ" />  

Standards of CFSI to evaluate the fragile level of courtries:  
<img src="https://github.com/ChaofanTao/MCM/blob/master/2018-COMAP/files/standard.png" width = "500" height = "100" alt="standard" />  

Impact of climate change by projection:  
<img src="https://github.com/ChaofanTao/MCM/blob/master/2018-COMAP/files/vector.png" width = "800" height = "200" alt="vec" />  

Fragility of South Sudan under original climate and friendly climate:  
<img src="https://github.com/ChaofanTao/MCM/blob/master/2018-COMAP/files/before.png" width = "270" height = "270" alt="before" />
<img src="https://github.com/ChaofanTao/MCM/blob/master/2018-COMAP/files/after.png" width = "270" height = "270" alt="aft" />  

Prediction method and Evaluation on the specific area (Egypt):  
<img src="https://github.com/ChaofanTao/MCM/blob/master/2018-COMAP/files/predict.png" width = "600" height = "300" alt="pre" />  
<img src="https://github.com/ChaofanTao/MCM/blob/master/2018-COMAP/files/trend.png" width = "600" height = "300" alt="t1" />  
<img src="https://github.com/ChaofanTao/MCM/blob/master/2018-COMAP/files/trend2.png" width = "600" height = "300" alt="t2" />  








