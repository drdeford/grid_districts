@interact
def grid_parameters(m=input_box(default = 5, label='Number of rows: '),n=input_box(default = 5, label='Number of columns: '),
 c=input_box(default = 5, label='Number of colors: '),ic=selector(["Random", "Stripes", "Empty", "Input your own"],default = "Random",label="Initial Coloring: ", buttons=True),
your_start=input_box(default=[[0,0,0,1,1],[0,0,2,1,1],[2,2,2,1,3],[2,4,3,3,3],[4,4,4,4,3]],label="Your Assignment Matrix" ),
ipop=selector(["Random", "Equal",  "Input your own"],default = "Random",label="Initial Population: ", buttons=True),
your_start_p=input_box(default=[[1 for x in range(5)] for y in range(5)],label="Your Population Matrix" ),
ivotes=selector(["Random", "Stripes",  "Input your own"],default = "Random",label="Initial Votes: ", buttons=True),
your_start_v=input_box(default=[[randrange(2) for x in range(5)] for y in range(5)]
,label="Your Vote Matrix" ),
 es=input_box(default=8,label="Edge width: "),ns=input_box(default=1000,label="Node size: "),auto_update=False):


    if ic == "Random":
        tempmat = matrix([[choice(range(c)) for x in range(m)] for y in range(n)])

    elif ic =="Stripes":
        tempmat = matrix([[int(x*c/m) for x in range(m)] for y in range(n)])
    elif ic =="Empty":
        tempmat = matrix(m,n)

    else:
        tempmat = matrix(your_start)
 
    if ipop == "Random":
        temppop = matrix(ZZ,[[randrange(1,10) for x in range(m)] for y in range(n)])

    elif ipop == "All Ones":
        temppop = matrix(ZZ,[[1 for x in range(m)] for y in range(n)])

    elif ipop == "Input your own":
        temppop = matrix(your_start_p)

    if ivotes == "Random":
        tempvotes = matrix(QQ,[[randrange(2) for x in range(m)] for y in range(n)])

    elif ivotes == "Stripes":
        tempvotes = matrix(QQ,[[(x%2) for x in range(m)] for y in range(n)])

    elif ivotes == "Input your own":
        tempvotes = matrix(QQ,your_start_v)

    @interact(layout=[['dcolors'],['pop'],['votes1'],['mat']])
    def grid_colors( dcolors=input_box(default=[choice(list(colors)) for x in range(c)],label="Colors:"),
    mat=('Assignments: ', tempmat),
    pop=('Populations: ', temppop),
    votes1 = ('Party 1 Vote Percentage: ', tempvotes),
    hc=checkbox(default=False,label='Highlight Cuts?'),
    pm=checkbox(default=True,label='Export matrix?'),
    epop=checkbox(default=True,label='Export Populations?'),
    evotes=checkbox(default=True,label='Export Votes?')):#,auto_update=False):
        #print(mat)
        #print(mat[0,0])
        g = graphs.Grid2dGraph(m,n)
        
        
        #dcolors=[choice(list(colors)) for x in range(c)]
        vcolors={x: [] for x in dcolors}


        cddict={x:[] for x in range(c)}

        pops = {v:pop[v[0],v[1]] for v in g.vertices()}

        v1s = {v:votes1[v[0],v[1]] for v in g.vertices()}

        nv1 = {v:v1s[v]*pops[v] for v in g.vertices()}

        tot_pop = sum(sum(pop))
        ideal_pop = float(tot_pop) / c
        tot_v1 = sum(nv1.values())
        tot_v2 = tot_pop - tot_v1
        tot_v1p = (tot_v1 / tot_pop).n(digits=3)
        tot_v2p = (tot_v2 / tot_pop).n(digits=3)


        

        




        for vert in g.vertices():
            vcolors[dcolors[mat[vert[0],vert[1]]]].append(vert)
            cddict[mat[vert[0],vert[1]]].append(vert)

            
        
        dpops = [sum([pops[y] for y in cddict[x]]) for x in range(c)]
        dvpops = [float(dpops[x] - ideal_pop) for x in range(c)] 
        dvpopsp = [100*float(dpops[x] - ideal_pop)/ideal_pop for x in range(c)] 
        dv1 = [sum([nv1[y] for y in cddict[x]]) for x in range(c)]
        dv1p = [100*(dv1[x]/dpops[x]).n(digits=3) for x in range(c)]
        seats1 = [int(dv1p[x] >50) for x in range(c)]
        tot_seats1 = sum(seats1)



        #print(vcolors)
        
        cut=0
        ecolors={'red':[],'black':[]}
        for edge in g.edges():
            if mat[edge[0][0],edge[0][1]] !=mat[edge[1][0],edge[1][1]]:
                ecolors['red'].append(edge)
                cut+=1

            else:
                ecolors['black'].append(edge)

        if hc == True:
            g.show(vertex_colors=vcolors,vertex_labels=False,vertex_size=ns,edge_thickness=es,vertex_shape='s')

            g.show(vertex_colors=vcolors,edge_colors=ecolors,vertex_labels=False,vertex_size=ns,edge_thickness=es,vertex_shape='s')

            g.delete_edges(ecolors['red'])

            g.show(vertex_colors=vcolors,vertex_labels=False,vertex_size=ns,edge_thickness=es,vertex_shape='s')

        else:
            r = g.plot(vertex_colors=vcolors,vertex_labels=False,vertex_size=ns,edge_thickness=es, vertex_shape='s')
            r.axes(False)
            r.show()

            p=g.plot(vertex_colors=vcolors,vertex_labels=False,vertex_size=ns,edge_thickness=es, vertex_shape='s')
            #p=plot()
            for vert in g.vertices():
                p = p + text(str(pops[vert]),(vert[1],-vert[0]),color="white",zorder=10)
            p.axes(False)
            p.show()


            q=g.plot(vertex_colors={'white':[vert for vert in g.vertices()]},vertex_labels=False,vertex_size=ns,edge_thickness=es, vertex_shape='s')
            #q=plot()

            for vert in g.vertices():
                q = q + text(str(nv1[vert]),(vert[1]-.1,-vert[0]),color=dcolors[mat[vert[0],vert[1]]],zorder=10)
                q = q + text("/",(vert[1],-vert[0]),color=dcolors[mat[vert[0],vert[1]]],zorder=10)
                q = q + text(str(pops[vert]-nv1[vert]),(vert[1]+.1,-vert[0]),color=dcolors[mat[vert[0],vert[1]]],zorder=10)
            q.axes(False)

            q.show()



        global_rows = [['Total Population', tot_pop],['Ideal District Size', ideal_pop], ["Number of cut edges", cut],
["Proportion of cut edges", float(cut)/len(g.edges())],['Maximum Population Deviation', max([abs(dvpops[x]) for x in range(c)] )],
['Maximum Population Deviation %', max([abs(dvpopsp[x]) for x in range(c)] )],['Mean-Median', median([dv1p[x]/100 for x in range(c)])-mean([dv1p[x]/100 for x in range(c)])],
['Efficiency Gap',(tot_seats1/c).n()-2*tot_v1p+.5]]

        votes_rows=[['Whole Plan ', 'Votes', 'Votes %','Seats','Seats %'],
['Party 1', tot_v1,(100* tot_v1p), tot_seats1, 100*(tot_seats1/c).n(digits=3)],
['Party 2',tot_v2,(100*tot_v2p), c-tot_seats1, 100*((c-tot_seats1)/c).n(digits=3)]]

        pretty_print(table(global_rows)) 

        pretty_print(table(votes_rows)) 
        top = [x for x in range(c)]
        top.insert(0,'District #')
        dv2 = [dpops[x] - dv1[x] for x in range(c)]
        dpops.insert(0,'District Populations')
        dvpops.insert(0,'Deviation from Ideal') 
        dvpopsp.insert(0,'Deviation from Ideal %')
        dv2p = [100-dv1p[x] for x in range(c)]
        dv1.insert(0,'Party 1 Votes')
        dv2.insert(0,'Party 2 Votes')
        dv1p.insert(0,'Party 1 Votes %')

        dv2p.insert(0,'Party 2 Votes %')

        district_rows = [top , dpops, dvpops, dvpopsp, dv1,dv1p,dv2,dv2p]

        pretty_print(table(district_rows)) 
       


        if pm == True:
            outl = []
            for x in range(mat.ncols()):
                outl.append(mat[x])
            pretty_print("Current Plan:", " ",outl)
        if epop == True:
            outl = []
            for x in range(pop.ncols()):
                outl.append(mat[x])
            pretty_print("Current Populations:", " ",outl)
        if evotes == True:
            outl = []
            for x in range(votes1.ncols()):
                outl.append(votes1[x])
            pretty_print("Current Plan:", " ",outl)

