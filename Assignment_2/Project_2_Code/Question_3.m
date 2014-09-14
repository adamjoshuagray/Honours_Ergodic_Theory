E           = load('edgelist.txt');
[q_20, B]   = PageRank(E, 0.20);
[q_50, B]   = PageRank(E, 0.50);
