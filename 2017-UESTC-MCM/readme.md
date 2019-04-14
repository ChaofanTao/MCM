# Problem A: Drone Clusters as Sky Light Displays
Intel developed its Shooting Star drone and is using clusters of these drones for aerial light shows. In 2016, a cluster of 500 drones, controlled by a single laptop and one pilot, performed a beautifully choreographed light show <https://www.youtube.com/watch?v=jNIAzeU8POQ>.  

Your university has an annual festival and is considering adding an outdoor aerial light show. The president has asked your team to investigate the idea of using drones to create three possible sky displays.  
__Part I__ – For each display:
a) Determine the number of drones required and mathematically describe the initial location for each drone device that will result in the sky display (similar to a fireworks display) of a static image.  
b) Determine the flight paths of each drone or set of drones that would animate your image and describe the animation.  
Display 1: Dragon  
Display 2: The logo of uestc    
Display 3: Create your own image  
__Part II__ – Determine and discuss the requirements for your 3-display light show to include, but not limited to, the number of drones, required launch area, required air space, safety considerations, and duration of the aerial light show.  
__Part III__ – Write a two-page memo to the president of your university to report the results of your investigation and make a recommendation as to whether or not to do the aerial light show.  

__Your submission__ should consist of:
* One-page signature Sheet
* One-page Summary Sheet
* Two-page memo to the Mayor  
***  
# Summary of Our Solution
With hundreds of intel drones light up the sky, people are increasingly attracted by the drone clusters. Given an image, drone clusters can display it vividly in the sky. Our goal is to determine the positions of the drones and devise an optimized flight path for them.  

To simplify modeling process, we assume the air space is big enough and there is not any obstacle in the sky. Besides, we firstly ignore the factor of weather. We begin our work with the image processing. Using five operators respectively (Sobel, Roberts, Prewitt, Laplasian and Canny ), we extract the edge-characteristics of the image and choose the most suitable one. Then we select 900 dots from the edge and determine the initial positions of the drones.  

Second, we are expected to allocate the drones to their positions in the sky. It is a typical Allocation Problem and we use the Hungarian Algorithm to get the optimized solution.  

Third, we establish the Dynamic Route Planning Model and regard Artificial Potential Field (APF)as a suitable and effective algorithm. By conducting two virtual potential fields—attraction field and repulsion field, we could quickly determine the drones’ optimized route. Furthermore, based on the traditional APF, we investigate its limitations and put forward our modification. Via MATLAB, we successfully devise the optimized flight path.  

Finally, we make sensitivity analysis for our model and analyze its strengths and weaknesses. We believe our model is robust and provide our recommendation to do the aerial light show in our university.  

The image that set of drones should animate on the sky:  
<img src="https://github.com/ChaofanTao/MCM/blob/master/2017-UESTC-MCM/files/dragon3.jpg" width = "220" height = "220" alt="Dragon" />
<img src="https://github.com/ChaofanTao/MCM/blob/master/2017-UESTC-MCM/files/uestc.jpg" width = "220" height = "220" alt="UESTC" />
<img src="https://github.com/ChaofanTao/MCM/blob/master/2017-UESTC-MCM/files/firework.jpg" width = "220" height = "220" alt="Firework" />

Feature extraction via various image detectors (take the image of dragon as example):  
<img src="https://github.com/ChaofanTao/MCM/blob/master/2017-UESTC-MCM/files/dragon_fea.png" width = "800" height = "400" alt="feature" />  

The simulated flight path of drones' group and transformation via our method (2d and 3d version), every blue point denots a drone:  
<img src="https://github.com/ChaofanTao/MCM/blob/master/2017-UESTC-MCM/files/change1.gif" width = "300" height = "300" alt="g1" />
<img src="https://github.com/ChaofanTao/MCM/blob/master/2017-UESTC-MCM/files/change2.gif" width = "300" height = "300" alt="g1" />  
<img src="https://github.com/ChaofanTao/MCM/blob/master/2017-UESTC-MCM/files/dragon_2d.gif" width = "300" height = "300" alt="g1" />
<img src="https://github.com/ChaofanTao/MCM/blob/master/2017-UESTC-MCM/files/dragon_3d.gif" width = "300" height = "300" alt="g1" />   


