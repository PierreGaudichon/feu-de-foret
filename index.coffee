rfile = require "rfile"

Foret = require "./Foret.coffee"



# n = 100
# ratios = {}
# for p in [0.3..0.7] by 0.01
# 	r = 0
# 	for i in [0...n]
# 		g = new Grille 100, 100, p
# 		g.initialise()
# 		r += (g.attends().ratio / n)
# 	ratios[p] = r
#
# wfile "stats.json", JSON.stringify ratios, null, "\t"



rfile "stats.json"
	.then JSON.parse
	.then (s) -> [(k for k, v of s), (v for k, v of s)]
	.then console.log
