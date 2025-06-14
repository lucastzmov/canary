-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{ minlevel = 1, maxlevel = 8, multiplier = 90000000 },
	{ minlevel = 9, maxlevel = 20, multiplier = 90000000 },
	{ minlevel = 21, maxlevel = 50, multiplier = 80000000 },
	{ minlevel = 51, maxlevel = 100, multiplier = 70000000 },
	{ minlevel = 101, maxlevel = 150, multiplier = 50000000 },
	{ minlevel = 151, maxlevel = 200, multiplier = 40000000 },
	{ minlevel = 201, maxlevel = 300, multiplier = 25000000 },
	{ minlevel = 301, maxlevel = 400, multiplier = 20000000 },
	{ minlevel = 401, maxlevel = 500, multiplier = 10000000 },
	{ minlevel = 501, maxlevel = 600, multiplier = 7000000 },
	{ minlevel = 601, maxlevel = 700, multiplier = 6000000 },
	{ minlevel = 701, maxlevel = 800, multiplier = 5000000 },
	{ minlevel = 801, maxlevel = 900, multiplier = 4000000 },
	{ minlevel = 901, maxlevel = 1000, multiplier = 3000000 },
	{ minlevel = 1001, maxlevel = 1200, multiplier = 2000000 },
	{ minlevel = 1201, multiplier = 2000000 }
}

skillsStages = {
	{ minlevel = 1, maxlevel = 80, multiplier = 100000 },
	{ minlevel = 81, maxlevel = 100, multiplier = 70000 },
	{ minlevel = 101, maxlevel = 120, multiplier = 40000 },
	{ minlevel = 121, maxlevel = 300, multiplier = 20000 },
	{ minlevel = 301, multiplier = 1000 }
}

magicLevelStages = {
	{ minlevel = 0, maxlevel = 80, multiplier = 100000 },
	{ minlevel = 81, maxlevel = 100, multiplier = 70000 },
	{ minlevel = 101, maxlevel = 120, multiplier = 40000 },
	{ minlevel = 121, maxlevel = 130, multiplier = 30000 },
	{ minlevel = 131, maxlevel = 300, multiplier = 20000 },
	{ minlevel = 301, multiplier = 10000 }
}
