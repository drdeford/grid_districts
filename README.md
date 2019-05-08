# Partitions of Grids

Source code for the two interactive grid partitioning tools, hosted on my <a href="https//people.csail.mit.edu/ddeford">academic webpage</a>. The purpose of these widgets is to provide an easy interface for constructing examples on small grids for combinatorial questions and as a teaching tool for introducing people to some of the underlying mathematics of <a href="https//people.csail.mit.edu/ddeford/CAPR.php">computational redistricting</a>. The two versions offer different amount of customization and different metrics that are evaluated on the plans: 
<ul>
  <li>  <a href="https//people.csail.mit.edu/ddeford/grid_cuts.html">Basic Version</a> The basic version focuses on building partitions by coloring the nodes in a grid graph and measuring how many edges are cut in the resulting partition. Cut edges are edges of the graph whose endpoints belon to different districts. Usually, partitions with a smaller number of cut edges are more visually appealing. The figures below show a partition of the 5x5 grid into 5 equally sized pieces with the cut edges highlighted and then removed. </li>
  
![alt text](https://github.com/drdeford/grid_districts/blob/master/Figures/basic1.png "Partition of a 5x5 grid")
  
![alt text](https://github.com/drdeford/grid_districts/blob/master/Figures/basic2.png "Highlighting the cut edges")
    
![alt text](https://github.com/drdeford/grid_districts/blob/master/Figures/basic3.png "After cutting the edges")

  <li> <a href="https//people.csail.mit.edu/ddeford/grid_cuts_advanced.html">Advanced Version</a> The advanced version adds population and partisan data to the nodes which allows for more complex demonstrations. This version also reports some simple measures of partisan imbalance that are used to evaluate real-world districting plans. The figures below show that same districting plan as above but with populations and vote totals overlayed on the nodes of the grid and the table shows the basic statistcs for this combination of population, electoral, and districting data.  </li>
  
![alt text](https://github.com/drdeford/grid_districts/blob/master/Figures/adv2.png "Populations")
    
![alt text](https://github.com/drdeford/grid_districts/blob/master/Figures/adv3.png "Vote Totals")

<table border="1" cellpadding="5" cellspacing="5">
  <tr><td> Total Population </td><td>	250 </td></tr>
 <tr><td>Ideal District Size  </td><td>		50.0</td></tr>
 <tr><td>Number of cut edges  </td><td>		18</td></tr>
 <tr><td>Proportion of cut edges  </td><td>		0.45</td></tr>
 <tr><td>Maximum Population Deviation  </td><td>		22.0</td></tr>
 <tr><td>Maximum Population Deviation %  </td><td>		44.0</td></tr>
 <tr><td>Mean-Median  </td><td>		−0.0473</td></tr>
 <tr><td>Efficiency Gap  </td><td>		−0.188</td></tr>
</table>
  <table border="1" cellpadding="5" cellspacing="5">
 
<tr><td>Whole Plan  </td><td>		Votes  </td><td>		Votes %  </td><td>		Seats  </td><td>		Seats %</td></tr>
 <tr><td>Party 1  </td><td>		136 </td><td>	
	54.4 </td><td>	
	2 </td><td>	
	40.0</td></tr>
 <tr><td>Party 2  </td><td>		114 </td><td>	
	45.6 </td><td>	
	3 </td><td>	
	60.0</td></tr>
</table>
  <table border="1" cellpadding="5" cellspacing="5">

 <tr><td>District Number  </td><td>	 	0 </td><td>	
	1 </td><td>	
	2 </td><td>	
	3 </td><td>	
	4</td></tr>
 <tr><td>District Populations  </td><td>		72 </td><td>	
	51 </td><td>	
	62 </td><td>	
	28 </td><td>	
	37</td></tr>
 <tr><td>Deviation from Ideal  </td><td>		22.0 </td><td>	
	1.0 </td><td>	
	12.0 </td><td>	
	−22.0 </td><td>	
	−13.0</td></tr>
 <tr><td>Deviation from Ideal %  </td><td>		44.0 </td><td>	
	2.0 </td><td>	
	24.0 </td><td>	
	−44.0 </td><td>	
	−26.0</td></tr>
 <tr><td>Party 1 Votes  </td><td>		42 </td><td>	
	34 </td><td>	
	29 </td><td>	
	13 </td><td>	
	18</td></tr>
 <tr><td>Party 1 Votes %  </td><td>		58.3 </td><td>	
	66.7 </td><td>	
	46.8 </td><td>	
	46.4 </td><td>	
	48.6</td></tr>
 <tr><td>Party 2 Votes  </td><td>		30 </td><td>	
	17 </td><td>	
	33 </td><td>	
	15 </td><td>	
	19</td></tr>
 <tr><td>Party 2 Votes %  </td><td>		41.7 </td><td>	
	33.3 </td><td>	
	53.2 </td><td>	
	53.6 </td><td>	
	51.4</td></tr>
   </table>
  </ul>
  

  
   <h2>  Interface Instructions: </h2>
<ul>
<li> <b>Grid Setup: </b> The first set of inputs controls the dimensions of the grid and the number of colors to use. </li>
<li> <b>Initial Coloring: </b>The next set controls the choice of initial coloring. Random, stripes, and empty are reasonably self-explanatory. If you select "Input Your Own" the coloring will start with
the labels you input in the "Initial Coloring" box, otherwise this is ignored. I put together a nice starting example for the 5x5 to start you off. </li>
<li><b>Color Choice: </b> Whenever you change the settings above, a new random list of colors is generated. You can enter your own choices by replacing any of the ones listed in the terminal (particularly if it generated two colors that were too similar) and pressing the enter key. The full list of 
allowed color names can be found <a href="https://matplotlib.org/gallery/color/named_colors.html"> here</a>. </li>
<li><b>Changing Assignments: </b> Changing values in the assignments matrix and pushing the submit button will update the colors in the plot and the population and cut edges computations below.
Toggling the "Highlight Cuts" box will display the cut edges in red on the graph.   </li>
<li><b>Changing Populations: </b> Changing values in the population matrix will adjust the number of voters living in each square of the grid. Note that forming population zero districts will crash the program. </li>
<li><b>Changing Votes: </b> The values in the votes matrix and represent the proportion of the population in the corresponding node that vote for the first party. Changing these values
changes the distribution of voters across the grid and hence which party wins or loses each in each district. </li>
<li><b>Exporting Colorings: </b> If you make a coloring you particularly like, you can press the final checkbox to write the labels to the screen. This will allow you to copy this coloring 
and paste it into the "Your Matrix" box. </li>
</ul>

![alt text](https://github.com/drdeford/grid_districts/blob/master/Figures/interface_ex.png "Interface Example")



<h2> Statistics Details:</h2>
The tables below the graph report statistics for the whole plan and individual districts:
<ul>
<li> Global Measures</li>
<ul>
<li> <b>Total Population</b> is the sum of all of the individual node populations.</li>
<li> <b>Ideal District Size</b> is the total population divided by the number of districts.</li>
<li> <b>Number of Cut Edges</b> is the number of edges that connect nodes of different colors.</li>
<li> <b>Proportion of Cut Edges</b> is the fraction of edges that connect nodes of different colors.</li>
<li> <b>Population Deviation</b> is the largest difference between the population of a specific district and the ideal population value.</li>
<li> <b>Votes</b> is the total number of votes for each party.</li>
<li> <b>Seats</b> is the total number of districts won by each party.</li>
<li> <b>Mean-Median</b> is a measure of partisan bias equal to the difference between the median and mean of the district vote percentages.</li>
<li> <b>Efficiency Gap</b> is a measure of partisan bias that divides the difference between the parties respective wasted vote totals by the total number of votes.</li>
</ul>
<li> District Measures</li>
<ul>
<li> <b>Population</b> is the sum of the populations of all nodes of each color.</li>
<li> <b>Population Deviation</b> is the difference between the population of thedistrict and the ideal population value.</li>
<li> <b>Votes</b> is the total number of votes for each party in that district.</li>
</ul>
</ul>
<h2> Activity Examples:</h2> 

<ul>
<li>Given a fixed grid and number of colors can you find the coloring with the minimum number of cut edges? </a>
<li> Using the 5x5 grid with all nodes having population 1 can you construct a set of districts along with some assignment of the votes so that party 1 gets 40% of the votes but no seats?</li>
<li> Can you find a plan with a 50-50 vote share and a mean-median score less than 1% but with a difference of 2 seats between the parties?</li>
<li> Can you find a plan with a small efficiency gap and a large mean-median score? How about the other way around?</li>
</ul>
