local gc = Var("GameCommand");

local string_name = gc:GetText()
local string_expl = THEME:GetString(Var "LoadingScreen", gc:GetName().."Explanation")
local icon_color = ModeIconColors[gc:GetName()];
local icon_size = 192

local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	OnCommand=cmd(diffusealpha,0;linear,0.4;diffusealpha,1;);
	GainFocusCommand=cmd(stoptweening;bob;effectmagnitude,0,0,3;decelerate,0.1;zoom,0.95);
	LoseFocusCommand=cmd(stoptweening;stopeffect;decelerate,0.1;zoom,0.9);
	OffCommand=cmd(decelerate,0.2;zoom,0.7;diffusealpha,0;);
	
	LoadActor("_background base") .. {
		LoseFocusCommand=cmd(diffuse,ColorMidTone(icon_color););
		GainFocusCommand=cmd(diffuse,icon_color;);
	};
	
	LoadActor( gc:GetName() ) .. {
		InitCommand=cmd(addy,-20;diffuse,Color.Black);
		GainFocusCommand=cmd(diffusealpha,1.0);
		LoseFocusCommand=cmd(diffusealpha,0.7;);
	};

	-- todo: generate a better font for these.
	LoadFont("_overpass 48px")..{
		Text=string.upper(string_name);
		InitCommand=cmd(horizalign,center;y,icon_size/3.4;zoom,0.5;maxwidth,icon_size*1.3;diffusecolor,color("#000000"););
		GainFocusCommand=cmd(diffusealpha,0.8);
		LoseFocusCommand=cmd(diffusealpha,0.6;);
	};
	-- Will this ever actually be used?
	-- LoadFont("Common Normal")..{
		-- Text=string.upper(string_expl);
		-- InitCommand=cmd(y,27.5;maxwidth,232);
	-- };
	
	LoadActor("_highlight") .. {
		LoseFocusCommand=cmd(stopeffect;decelerate,0.1;diffuse,Color.Invisible;);
		GainFocusCommand=cmd(decelerate,0.2;diffuse,Color.White;diffuseshift;effectcolor1,Color.White;effectcolor2,color("#FFFFFF99"););
	};
};
return t