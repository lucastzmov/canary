-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{ minlevel = 1, maxlevel = 8, multiplier = 900 },
	{ minlevel = 9, maxlevel = 20, multiplier = 900 },
	{ minlevel = 21, maxlevel = 50, multiplier = 800 },
	{ minlevel = 51, maxlevel = 100, multiplier = 700 },
	{ minlevel = 101, maxlevel = 150, multiplier = 500 },
	{ minlevel = 151, maxlevel = 200, multiplier = 400 },
	{ minlevel = 201, maxlevel = 300, multiplier = 250 },
	{ minlevel = 301, maxlevel = 400, multiplier = 200 },
	{ minlevel = 401, maxlevel = 500, multiplier = 100 },
	{ minlevel = 501, maxlevel = 600, multiplier = 70 },
	{ minlevel = 601, maxlevel = 700, multiplier = 60 },
	{ minlevel = 701, maxlevel = 800, multiplier = 50 },
	{ minlevel = 801, maxlevel = 900, multiplier = 40 },
	{ minlevel = 901, maxlevel = 1000, multiplier = 30 },
	{ minlevel = 1001, maxlevel = 1200, multiplier = 20 },
	{ minlevel = 1201, multiplier = 20 }
}

skillsStages = {
	{ minlevel = 1, maxlevel = 80, multiplier = 100 },
	{ minlevel = 81, maxlevel = 100, multiplier = 70 },
	{ minlevel = 101, maxlevel = 120, multiplier = 40 },
	{ minlevel = 121, maxlevel = 300, multiplier = 20 },
	{ minlevel = 301, multiplier = 10 } 
}

magicLevelStages = {
	{ minlevel = 0, maxlevel = 80, multiplier = 100 },
	{ minlevel = 81, maxlevel = 100, multiplier = 70 },
	{ minlevel = 101, maxlevel = 120, multiplier = 40 },
	{ minlevel = 121, maxlevel = 130, multiplier = 30 },
	{ minlevel = 131, maxlevel = 300, multiplier = 20 },
	{ minlevel = 301, multiplier = 10 }
}
