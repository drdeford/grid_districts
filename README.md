# Partitions of Grids

Source code for the two interactive grid partitioning tools, hosted on my <a href="https//people.csail.mit.edu/ddeford">academic webpage</a>. The purpose of these widgets is to provide an easy interface for constructing examples on small grids for combinatorial questions and as a teaching tool for introducing people to some of the underlying mathematics of <a href="https//people.csail.mit.edu/ddeford/CAPR.php">computational redistricting</a>. The two versions offer different amount of customization and different metrics that are evaluated on the plans: 
<ul>
  <li>  <a href="https//people.csail.mit.edu/ddeford/grid_cuts.html">Basic Version</a> The basic version focuses on building partitions by coloring the nodes in a grid graph and measuring how many edges are cut in the resulting partition. Cut edges are edges of the graph whose endpoints belon to different districts. Usually, partitions with a smaller number of cut edges are more visually appealing. The figures below show a partition of the 5x5 grid into 5 equally sized pieces with the cut edges highlighted and then removed. </li>
  ![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Partition of a 5x5 grid")
    ![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Highlighting the cut edges")
  ![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "After cutting the edges")

  <li> <a href="https//people.csail.mit.edu/ddeford/grid_cuts_advanced.html">Advanced Version</a> The advanced version adds population and partisan data to the nodes which allows for more complex demonstrations. This version also reports some simple measures of partisan imbalance that are used to evaluate real-world districting plans. </li>
  
  
  </ul>
  
  
  
   <h2>  Instructions: </h2>
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


<h2> Statistics:</h2>
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
<h2> Activity:</h2> 

<ul>
<li> Using the 5x5 grid with all nodes having population 1 can you construct a set of districts along with some assignment of the votes so that party 1 gets 40% of the votes but no seats?</li>
<li> Can you find a plan with a 50-50 vote share and a mean-median score less than 1% but with a difference of 2 seats between the parties?</li>
<li> Can you find a plan with a small efficiency gap and a large mean-median score? How about the other way around?</li>
</ul>
