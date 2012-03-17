/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* appearance */
static const char font[]            = "-*-envy code r-medium-r-*-*-10-*-*-*-*-*-*-*";

#define NUMCOLORS       4
static const char colors[NUMCOLORS][ColLast][8] = {
    //  border      foreground      background
    { "#222222",    "#777777",      "#262626" },    // 0 = NORMAL
    { "#777777",    "#5496FF",      "#262626" },    // 1 = SELECTED
    { "#5496FF",    "#262626",      "#5496FF" },    // 2 = URGENT/WARNING
    { "#FF0000",    "#FF0000",      "#262626" }     // 3 = ERROR
};

static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 0;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "www", "dev", "dev", "misc", "misc" };

#define WWW  1 << 0
#define DEV1 1 << 1
#define DEV2 1 << 2
#define MISC 1 << 3

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     	NULL,     	NULL,     	MISC,      	True,       -1 },
	{ "Chromium",  	NULL,       NULL,       WWW,    	False,     	-1 },
	{ "Pidgin",		NULL,		NULL,		MISC,		True,		-1 },
    { "trayer",     NULL,       NULL,       ~0,         True,       -1 },
    { "Wicd",       NULL,       NULL,       0,          True,       -1 },
    { "Thunar",     NULL,       NULL,       0,          True,       -1 }
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ " T",      tile },    /* first entry is default */
	{ " N",      NULL },    /* no layout function means floating behavior */
//	{ " B",      nbstack }
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", font, "-nb", colors[0][ColBG], "-nf", colors[0][ColFG], "-sb", colors[1][ColBG], "-sf", colors[1][ColFG], NULL };
static const char *termcmd[]  = { "urxvtc", NULL };
static const char *launchcmd[] = { "gmrun", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
    { MODKEY,                       XK_c,       spawn,          SHCMD("/home/revk/.config/dwm/bin/change_layout.sh") },
	{ MODKEY,                       XK_p,       spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return,  spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_q,       spawn,          {.v = launchcmd } },
    { 0,                            XF86XK_AudioRaiseVolume,    spawn, SHCMD("amixer set Master 5%+") },
    { 0,                            XF86XK_AudioLowerVolume,    spawn, SHCMD("amixer set Master 5%-") },
    { 0,                            XF86XK_AudioMute,           spawn, SHCMD("amixer set Master toggle") },
    { 0,                            XF86XK_AudioPlay,           spawn, SHCMD("ncmpcpp toggle") },
    { 0,                            XF86XK_AudioStop,           spawn, SHCMD("ncmpcpp stop") },
    { 0,                            XF86XK_AudioPrev,           spawn, SHCMD("ncmpcpp prev") },
    { 0,                            XF86XK_AudioNext,           spawn, SHCMD("ncmpcpp next") },
	{ MODKEY,                       XK_b,       togglebar,      {0} },
	{ MODKEY,                       XK_j,       focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,       focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_h,       setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,       setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return,  zoom,           {0} },
	{ MODKEY,                       XK_Tab,     view,           {0} },
	{ MODKEY,                       XK_a,       killclient,     {0} },
	{ MODKEY,                       XK_t,       setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,       setlayout,      {.v = &layouts[1]} },
	//{ MODKEY,                       XK_m,       setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,   setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,   togglefloating, {0} },
	{ MODKEY,                       XK_0,       view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,       tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,   focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,  focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,   tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,  tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	{ MODKEY|ShiftMask,             XK_c,       quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

