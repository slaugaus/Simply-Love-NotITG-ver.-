
feetBaseZoom = .275
JudgeY = 20

lifeBarSizeAdd.Height = lifeBarSizeAdd.Height - 80
lifeBarSizeAdd.OffsetY = lifeBarSizeAdd.OffsetY + 40

judgmentFontList = { 'Love', 'LoveSD', 'Tactics', 'ITG2', 'Chromatic', 'GN', 'NJSRT', 'Misfits', 'WP', 'DIE', 'H', 'Coaster' }
voiceOption = true

rateModsPay = { "1.0x", "1.1x", "1.2x", "1.3x", "1.4x", "1.5x", "1.6x", "1.7x", "1.8x", "1.9x", "2.0x" }
rateModsFree = { "1.0x", "1.1x", "1.2x", "1.3x", "1.4x", "1.5x", "1.6x", "1.7x", "1.8x", "1.9x", "2.0x", "0.5x", "0.6x", "0.7x" , "0.8x", "0.9x" }

screenList = { Gameplay = 'ScreenStage' , SelectMusic = 'ScreenSelectMusic' , PlayerOptions = 'ScreenPlayerOptions' , TitleMenu = ScreenTitleBranch  , NameEntry = 'ScreenNameEntryTraditional' , Evaluation = SelectEvaluationScreen , Summary = 'Summary' , Ending = SelectEndingScreen }

playerOptions[1] = { 'SpeedType','SpeedNumber','Mini','Perspective','NoteSkin','Turn','JudgmentFont','Voice','Rate' }
playerOptions[2] = { 'Accel','Scroll','Effect','Appearance','Handicap','InsertTaps','InsertOther','Hide','Ghost','Compare','Measure','LifeBar' }

function CompareTextFormat(self,n) self:zoom(.3) end -- This is added on top of the base positioning etc.

ShowAllInRow = true

function NonCombos()
	local t = OptionRowBase('NonCombos')
	t.OneChoiceForAllPlayers = true
	t.Choices = { "On", "Decents Only", "Off" }
	t.LoadSelections = function(self, list, pn) if not Decents() then list[3] = true elseif not WayOffs() then list[2] = true else list[1] = true end end
	t.SaveSelections = function(self, list, pn)
		if list[1] then SetPref('JudgeWindowSecondsGood',0.135) SetPref('JudgeWindowSecondsBoo',0.180) end
		if list[2] then SetPref('JudgeWindowSecondsGood',0.135)	SetPref('JudgeWindowSecondsBoo',0.135) end
		if list[3] then	SetPref('JudgeWindowSecondsGood',0.102)	SetPref('JudgeWindowSecondsBoo',0.102) end
	end
	return t
end

function Decents() if math.abs(PREFSMAN:GetPreference('JudgeWindowSecondsGood') - 0.135) < .001 then return true end end
function WayOffs() if math.abs(PREFSMAN:GetPreference('JudgeWindowSecondsBoo') - 0.180) < .001 then return true end end

-- not even used, but whatever.
function wrap(val,max,min)
	if not min then min = 0 end
	return math.mod(val+(max-min+1)-min,max-min+1)+min
end

WindowTitles = {
    -- blastix riotz
	"balstix riots",
    "Blastix Riotix",
    "ah, camila my favorite speedcore artist, artist of blastx ritz",
    "blasterix riotz",
    "astix and iotz",
    "Blastix Riot Police",
    -- jackbox shirts
	"BAZGINA",
	"I LOVE VIDEO GAMES",
    "I VIDEO LOVE GAMES",
    "VIDEO LOVE I GAMES",
    "THIS IS FUNNY. PLEASE LAUGH",
    -- osu! original
	"It's like osu! but on a shirt",
	"It's like osu! but with arrows",
    "Super Smash Bros. Ultimate X osu!",
    "\"osu is the fortnite of rhythm games\" -ori",
    -- obama
	"Obama chuckled. \"You mean the Chaos Emeralds?\"",
    "Then perish",
    "\"obamid scheme\" -cering",
    -- bad dragon
    "studio mdrqnxtagon",
    "Mfqsdxdragon",
    -- @scrubquotesx
    "You just have to hit the arrows when they overlap. It's not hard come on",
    "Why do you keep missing those round notes?",
    "This has just devolved into looking at colors on a certain part of the screen, hasn\’t it.",
    "Your cheating you already have 573 combo before starting the song",
    -- *recontrols your galaxy*
    "dyscontolled galaxt",
    "gyscontrolled dalaxy",
    "dyscontrolled galaxy is an 11",
    -- fast luminous body
    "slow star kanade",
    "speed star canada",
    -- how come there isn't a
    "if egoism 440 is so good then how come there isn\'t an egoism 441",
    "if round 1 is so good then how come there isn\'t a round 2",
    -- reaction time funny
    "arrow funny time",
    "sudden arrow comedy",
    "super reaction time hilarious moments",
    -- stolen from xero's theme
    "Mashing with your hands",
    "Konmai will sue",
    "Dance Mat Game",
    "Chegg: *Kweh*",
    "?  ?? ?? ??",
    "Getting whipped by mods",
    "UKSRTale release imminent",
    "Show me your metrics.ini",
    "MAX300 Simulator",
    "O-oooooooooo AAAAE-A-A-I-A-U- JO-oooooooooooo AAE-O-A-A-U-U-A- E-eee-ee-eee AAAAE-A-E-I-E-A- JO-ooo-oo-oo-oo EEEEO-A-AAA-AAAA",
    "osu!",
    "hecc",
    "Powered by Ligma",
    "I love Video Games! Like a Video Game! Like a whole Video Game! You have no Video Game!!",
    "Just bracket it, you'll be fine!",
    "It's like osu, but you use your feet",
    "Ignotis me senpai",
    -- also try
    "Also try Etterna!",
    "Also try osu!",
    "Also try Quaver!",
    "Also try Pulsen?",
    "Also try Rhythm Girl?",
    "Also try Project: Bits?",
    "Also try Tone Sphere!",
    "Also try Arcaea!",
    "Also try Phigros!",
    "Also try... brackets?",
    -- special
    "\"CHAOS\" SPECIAL",
    "\"AIR\" SPECIAL",
    "\"GROOVE RADAR\" SPECIAL",
    "\"FREEZE\" SPECIAL",
    "\"STREAM\" SPECIAL",
    "\"VOLTAGE\" SPECIAL",
    -- unsorted
    "UKSRT.txt Chegg: Eggskuasion Eggskuasion Eggskuasion Eggskuasion Eggskuasion Eggskuasion Eggskuasion Eggskuasion Eggskuasion Eggskuasion Eggskuasion Eggskuasion",
    "Featuring Chegg from the Chegg Random Series",
	"\"grip and break down makes me want to grip and break my legs\" -exschwasion 2018",
	"GRAB SOME SKILL; It's FREE",
	"Graphic Missing",
	"I can't believe it's not ITG!",
	"Try not to break it again",
	"Is this loss?",
	"https://streamable.com/badky",
	"https://streamable.com/noooo",
	"I Can't Believe It's Gotten Even worse!",
	":loam:",
	":heck:",
	"Hi #score-share",
	"how do i loam react in real life",
    "H",
	"E",
    "M",  -- isfits in the prarie
	"When you post a meme in a chat but remember that that's where you stole it from",
	"IN THE GROOVE "..math.random(4,6),
	"15/81 is my favorite time signature",
	"That's right, Jay",
	"Israel Liven Approved!",
	"DON'T UWU: $350 PENALTY",
    "MASH FOR YOUR LIFE",
    "(Not Responding)",
    "The FitnessGram™ Pacer Test is a multistage aerobic capacity test that progressively gets more difficult as it continues. The 20 meter pacer test will begin in 30 seconds. Line up at the start. The running speed starts slowly, but gets faster each minute after you hear this signal. Wow your window is really wide",
    "FYI, Lua arrays start at 1",
    "Pretend there's a funny joke here",
    "MAX 360 DSP 15 with directional threat arrows",
    "In a desperate conflict, with a ruthless enemy...",
    "A bethesda.net account is required to view this title message",
    "T/N Kotaku means plan",
    "T/N kioku means plan",  -- [unconnected]
    "matoi.avi",
    "Do you feel ENJOY !!! Sorry for Disturb",
    "xross loss",
    "WINNERS DON\'T USE TKE BAR",
    "Taking a break?",
    "\"Ah, Fesh Pince, that was on the kid when i was a tv\"",
    "you have entered the comedy area",
    "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU",
    "Drake? Where's the window title?",
    "oh yeah woo modding",
    "\"nut conflict 440\" -nhan",
    "oops all dpads",
    "lol wwwwww mdr",
    "\"Oppa Morning Style !\" -exschwasion",
    "\"Imitation Crabmeat Finland\"",
    "\"use a car as the bar\"",
    "REAL gamers use the SHAQ.png noteskin",
    "Nope, no hints here",
    "Eat gyros to restore health!",
    "By Allen \"Taro Puke\" Games",
    "But first, we need to talk about parallel universes",
    "NEVER HAVE AN UNCONNECTED ARROW AFTER A JUMP UNLESS THE ARROW IS LEFT OR RIGHT",
    "MR CERING IT'S BEEN A PLEASURE",
    "i type mod_ease() a bajillion times and the arrows somehow do funny thing",
    "antimatter banmentions",
    "sound vore tex",
    "BASS KICK",
    "Good lord what is happening in uksrt general",
    "Do you STILL remember?",
    "yea",
    "cering harem VN",
    ".......2!",
    "footswanch branchet",
    "CHRISTIAN MOMS AGAINST DOUBLESTEPS",
    "crossover and bracket torture",
    "peaceful version -",
    "slaugaus\' \"title funny\" edition -",
    "artistically",
    "Yeah but can you pass D with a Q",
    "(scx + 120*(pn*2-7))",
    "Strange shape, wonderful sound",
    "UKSRTale never",
    "Fun fact: Nanahira is ~1 year older than Camellia",
    "nice pass, cool chart :thumbsup:",
    "bag nightcore",
    "Family Fun Slime Prank! Make Your Tac Today.",
    "What You Think",
    "yeha babeyyyyy",
    "standoff in the drive-thru",
    "Do you ever just?",
    "CAR????",
    "gameing google......."
}

-- original window title string: @string.format("%s %s  -  %s",FUCK_EXE and"NotITG"or"OpenITG",string.gsub(string.gfind(GetSerialNumber(),"%d+%-%x+")(),"%x+$",function(s)return string.format("%03d",tonumber(s,16))end),THEME:GetCurThemeName())

VersionInfo = string.format("SIMPLY LOVE (%s %s) - ",FUCK_EXE and"NotITG"or"OpenITG",string.gsub(string.gfind(GetSerialNumber(),"%d+%-%x+")(),"%x+$",function(s)return string.format("%03d",tonumber(s,16))end))

function GetRandomWindowTitle()
	return VersionInfo..WindowTitles[math.random(1,table.getn(WindowTitles))]  --math.random(1,table.getn(WindowTitles))
end

-- currently unused
DeathMessages = {
    "## is dead.",
    "your finished, ##",
    "[string \'in\']:3: attempted to index ##, a nil value",
    "## is not having a good time.",
    "Sayonara ## Wars",
    "Goodbye-bye ##",
    "## took an arrow to the face",
    "## failed to get a \"barely\"",
    "It\'s the pad\'s fault, ##",
    "One crossover too many, ##?",
    "Try pressing Ctrl+0 next time, ##",
    "Try pressing F8 next time, ##",
    "Watch out for those mines, ##",
    "## ate shint",
    "## didn't remember",
    "## didn't remeber",
    "## didn't rebember",
    "\"OUCH! that arrow hit ## in the face, haha, funny one\" -fortnite funny",
    "That file beat ## up and took their lunch money",
    "has ## tried moving or breathing"
}

function GetRandomDeathMsg(p)
    return ""..string.gsub(DeathMessages[math.random(1, table.getn(DeathMessages))], "##", p)    -- yes, i'm appending the message to nothing. trust me, it's for a good reason
end

