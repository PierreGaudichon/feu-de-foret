








module.exports = class Foret


	# Etat = Arbre : 0 | Feu : 1 | Cendre : 2
	# Position = {x: Integer, y: Integer}

	# cases :: [[Etat]]
	# enFeu :: [Position]
	# p :: Real
	# n :: Integer
	# m :: Integer


	# constructor :: Integer, Integer, Real -> @
	constructor: (@n, @m, @p) ->
		@cases = []
		for y in [0...@m]
			@cases[y] = []
			for x in [0...@n]
				@cases[y][x] = 0
		@enFeu = []


	# initialise :: Maybe(Position) -> null
	initialise: (pos) ->
		x = Math.floor Math.random()*@n
		y = Math.floor Math.random()*@m
		pos = pos ? {x, y}
		@enflamme pos


	# each: -> {x: Integer, y: Integer, etat: Etat}
	each: (f) ->
		r = []
		for y in [0...@m]
			for x in [0...@n]
				r.push {x, y, etat: @en {x, y}}
		return r


	# en :: Position -> Etat
	en: ({x, y}) ->
		if (0 <= x < @n) and (0 <= y < @m)
			@cases[y][x]


	# evolue :: Position, Etat -> null
	evolue: ({x, y}, etat) ->
		@cases[y][x] = etat


	# senflamme :: -> Boolean
	senflamme: ->
		Math.random() < @p


	# enflamme :: Position -> null
	enflamme: (p) ->
		@evolue p, 1
		@enFeu.push p


	# next :: -> null
	next: ->
		pos = @enFeu.shift()
		unless pos?
			return false
		{x, y} = pos
		@evolue {x, y}, 2
		for p in [{x: x+1, y}, {x: x-1, y}, {x, y: y+1}, {x, y: y-1}]
			@enflamme p if @en(p) is 0 and @senflamme()
		return true


	# toString :: -> String
	toString: ->
		style = ["T", "$", "."]
		s = ""
		for y in [0...@m]
			for x in [0...@n]
				s += style[@en {x, y}]
			s += "\n"
		return s


	# stats :: -> Hash
	stats: ->
		ratio: @each().filter(({etat}) -> etat is 0).length / (@n*@m)


	# attends :: -> Hash
	attends: ->
		while @next()
			null
		@stats()



