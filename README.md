
Simulation de feux de foret
===========================

Le défi peut se trouver [ici](https://zestedesavoir.com/forums/sujet/4690/novembre-2015-simulation-dun-feu-de-foret/)


Specs
-----


Grille : n*m Cases carrees
	n : width
	m : height

Probabilitee de passer en feu : p

Etat : Arbre, Feu, Cendres

Case : Position(x, y), Etat

Tour :
	chaque arbre en feu a des voisins
	chaque arbre en feu devient cendres
	chaque voisin arbre a une probabilité p de passer en feu

Initialisation :
	grille de n*m cases arbres
	1 case en feu

Voisin :
	case (x, y)
	voisin [(x+1, y), (x-1, y), (x, y+1), (x, y-1)]
		avec 0 <= voisin.x < n et 0 <= voisin.y < m
