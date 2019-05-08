@interact
def grid_parameters(m=input_box(default = 5, label='Number of rows: '),n=input_box(default = 5, label='Number of columns: '),
 c=input_box(default = 5, label='Number of colors: '),ic=selector(["Random", "Stripes", "Empty", "Input your own"],default = "Random",label="Initial Coloring: ", buttons=True),your_start=input_box(default=[[0,0,0,1,1],[0,0,2,1,1],[2,2,2,1,3],[2,4,3,3,3],[4,4,4,4,3]],label="Your Matrix" ), es=input_box(default=8,label="Edge width: "),ns=input_box(default=1000,label="Node size: "),auto_update=False):


    if ic == "Random":
        tempmat = matrix([[choice(range(c)) for x in range(m)] for y in range(n)])

    elif ic =="Stripes":
        tempmat = matrix([[int(x*c/m) for x in range(m)] for y in range(n)])
    elif ic =="Empty":
        tempmat = matrix(m,n)

    else:
        tempmat = matrix(your_start)
    @interact#(layout=[['dcolors'],['t1'],['c','d'],['t2']])
    def grid_colors( dcolors=input_box(default=[choice(list(colors)) for x in range(c)],label="Colors:"),mat=('Assignments: ', tempmat),hc=checkbox(default=False,label='Highlight Cuts?'),pm=checkbox(default=False,label='Export matrix?')):#,auto_update=False):
        #print(mat)
        #print(mat[0,0])
        g = graphs.Grid2dGraph(m,n)
        
        
        #dcolors=[choice(list(colors)) for x in range(c)]
        vcolors={x: [] for x in dcolors}

        for vert in g.vertices():
            vcolors[dcolors[mat[vert[0],vert[1]]]].append(vert)
            
        
        
        #print(vcolors)
        
        cut=0
        ecolors={'red':[],'black':[]}
        for edge in g.edges():
            if mat[edge[0][0],edge[0][1]] !=mat[edge[1][0],edge[1][1]]:
                ecolors['red'].append(edge)
                cut+=1

            else:
                ecolors['black'].append(edge)

        if hc ==True:
            g.show(vertex_colors=vcolors,vertex_labels=False,vertex_size=ns,edge_thickness=es,vertex_shape='s')

            g.show(vertex_colors=vcolors,edge_colors=ecolors,vertex_labels=False,vertex_size=ns,edge_thickness=es,vertex_shape='s')

            g.delete_edges(ecolors['red'])

            g.show(vertex_colors=vcolors,vertex_labels=False,vertex_size=ns,edge_thickness=es,vertex_shape='s')

        else:
            g.show(vertex_colors=vcolors,vertex_labels=False,vertex_size=ns,edge_thickness=es, vertex_shape='s')
              
        pretty_print("Number of cut edges: ", " ",cut)
        pretty_print("Proportion of cut edges: ", " ",cut/len(g.edges())," = ", (cut/len(g.edges())).n())

        pretty_print("Partition sizes"," ",[len(vcolors[dcolors[x]]) for x in range(c)])

        if pm == True:
            outl = []
            for x in range(mat.ncols()):
                outl.append(mat[x])
            pretty_print("Current Plan:", " ",outl)
