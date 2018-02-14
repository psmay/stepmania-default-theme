-- color based on screen name
function ScreenColor(screen)
    local colors = {
        ["ScreenSelectStyle"]         = ScreenColors.Style, 
        ["ScreenSelectPlayMode"]      = ScreenColors.PlayMode, 
        ["ScreenSelectMusic"]         = ScreenColors.Music, 
        ["ScreenSelectCourse"]        = ScreenColors.Course, 
        ["ScreenPlayerOptions"]       = ScreenColors.PlayerOptions,
        ["ScreenNestyPlayerOptions"]  = ScreenColors.PlayerOptions,
        ["ScreenOptionsService"]      = ScreenColors.OptionsService,
        ["ScreenEvaluationNormal"]    = ScreenColors.Evaluation, 
        ["ScreenHighScores"]    = ScreenColors.Evaluation, 
        ["ScreenEvaluationSummary"]   = ScreenColors.Summary, 
        ["ScreenStageInformation"]   = ScreenColors.StageInformation, 
        ["ScreenEditMenu"]			  = ScreenColors.Edit, 
        ["ScreenSMOnlineLogin"]			  = ScreenColors.Online, 
        ["ScreenNetRoom"]			  = ScreenColors.Online, 
        ["ScreenNetSelectMusic"]			  = ScreenColors.Online, 
		["ScreenNetEvaluation"]    = ScreenColors.Evaluation, 
        ["Default"]                   = ScreenColors.Default,
    }

    if colors[screen] then return colors[screen];
    else return colors["Default"]; end;
end;

ScreenColors = {
    Style           = color("#81468B"),
    PlayMode        = color("#b2350c"),
    Music           = color("#1268aa"),
    Online           = color("#1CA6A0"),
    Course          = color("#6D1646"),
    PlayerOptions   = color("#544abe"),
    OptionsService  = color("#5F2D41"),
    Evaluation      = color("#806635"),
    Summary         = color("#B38D47"),
    StageInformation  = color("#D05722"),
    Edit         = color("#B34754"),
    Default         = color("#5F2D41"),
}
ModeIconColors = {
    Normal      = color("#339FF2"),
    Rave        = color("#6BFF90"), 
    Nonstop     = color("#FF66AB"),
    Oni         = color("#FF714D"),
    Endless     = color("#6A62CA"),
}

GameColor = {
    PlayerColors = {
        [PLAYER_1] = color("#3982FF"),
        [PLAYER_2] = color("#FF4596"),
		both = color("#B27B96"),
    },
    PlayerDarkColors = {
        [PLAYER_1] = color("#023C9F"),
        [PLAYER_2] = color("#7F083C"),
		both = color("#5F2D41"),
    },
    Difficulty = {
        --[[ These are for 'Custom' Difficulty Ranks. It can be very  useful
        in some cases, especially to apply new colors for stuff you
        couldn't before. (huh? -aj) ]]
        Beginner    = color("#A165CE"),         --  purple
        Easy        = color("#50DA1A"),         -- green
        Medium      = color("#FFE53E"),         -- yellow
        Hard        = color("#FE4F49"),         -- orange
        Challenge   = color("#2DDBFF"),         -- light blue
        Edit        = color("0.8,0.8,0.8,1"),   -- gray
        Couple      = color("#ed0972"),         -- hot pink
        Routine     = color("#ff9a00"),         -- orange
        --[[ These are for courses, so let's slap them here in case someone
        wanted to use Difficulty in Course and Step regions. ]]
        Difficulty_Beginner = color("#A165CE"),     -- purple
        Difficulty_Easy     = color("#50DA1A"),     -- green
        Difficulty_Medium   = color("#FFE53E"),     -- yellow
        Difficulty_Hard     = color("#FE4F49"),     -- orange
        Difficulty_Challenge    = color("#2DDBFF"), -- light blue
        Difficulty_Edit     = color("0.8,0.8,0.8,1"),       -- gray
        Difficulty_Couple   = color("#ed0972"),             -- hot pink
        Difficulty_Routine  = color("#ff9a00")              -- orange
    },
    Stage = {
        Stage_1st   = color("#F6C455"),
        Stage_2nd   = color("#EDA858"),
        Stage_3rd   = color("#E69259"),
        Stage_4th   = color("#DD775B"),
        Stage_5th   = color("#D55E5D"),
        Stage_6th   = color("#CD445F"),
        Stage_Next  = color("#73ff00"),
        Stage_Final = color("#4BC6EB"),
        Stage_Extra1    = color("#B60052"),
        Stage_Extra2    = color("#FF499B"),
        Stage_Nonstop   = color("#FFD782"),
        Stage_Oni   = color("#FF714D"),
        Stage_Endless   = color("#6040A7"),
        Stage_Event = color("#9d324e"),
        Stage_Demo  = color("#9d324e")
    },
    Judgment = {
        JudgmentLine_W1     = color("#A0DBF1"),
        JudgmentLine_W2     = color("#F1E4A2"),
        JudgmentLine_W3     = color("#ABE39B"),
        JudgmentLine_W4     = color("#86ACD6"),
        JudgmentLine_W5     = color("#958CD6"),
        JudgmentLine_Held   = color("#FFFFFF"),
        JudgmentLine_Miss   = color("#F97E7E"),
        JudgmentLine_MaxCombo   = color("#ffc600")
    },
}

GameColor.Difficulty["Crazy"]       = GameColor.Difficulty["Hard"]
GameColor.Difficulty["Freestyle"]   = GameColor.Difficulty["Easy"]
GameColor.Difficulty["Nightmare"]   = GameColor.Difficulty["Challenge"]
GameColor.Difficulty["HalfDouble"]  = GameColor.Difficulty["Medium"]