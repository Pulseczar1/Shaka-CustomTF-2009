/*=======================================================//
// prozac.QC - CustomTF 3.2.OfN 		  - 15/11/2004 - //
// by Sergio Fumaña Grunwaldt - OfteN [cp]				 //
=========================================================//
 ProZac Message Of The Day (MOTD) and un/related stuff :)
=========================================================*/

#define MSG_OFTEN_CUTFVERSION "Running progs build 272 Û02¯02¯2009İ\n"

#define MSG_INFO "\nType ¢cmd help¢ to see additional client commands.\n"

#define MSG_CUTFVERSION   "ĞÒÏÚÁÃ CustomÔÆ VERSION 02-02-09" //WK Version Number

// PZ: customtf.com hasn't existed for a long time. Changed to: quakeworld.nu/wiki/Prozac-TF
#define MSG_INTRO  "Welcome to ĞÒÏÚÁÃ CustomÔÆ\na Quake ÔÆ MOD by ShakaUVM\n\nquakeworld®nu¯wiki¯Prozac-TF\n\nŸ\n\n"
#define MSG_INTRO2 "Based on the aussie ver by SB-1\nModified version by Clan Prozac\n\n" // Ÿ\n\n
// PZ: http://customtf.sourceforge.net/forum/ is basically just an archive now for the old code. Changed it to the Prozac Discord server.
// PZ NOTE: To get brown characters, take the value of white characters and add 8*16 (128). Will have to hex edit to get the value.
//          There are better ways to do this, but if you can't find them quickly, you can use a hex editor.
#define MSG_INTRO3 "Post bug reports and comments on:\nhttpsº¯¯discord®gg¯fp9sSZ5"

//WK 152 Default, must be > 6.
// PZ: Shaka had this set to 152. It was so fast that you could barely read a line before it went away.
//     Going back to 242. There might be a faster tick/frame rate in MVDSV, or something.
#define MOTD_FINISHED 242 //WK 1/7/7 420 //242		//Delay in 1/10th seconds for motd to show

void() PrintProzacMOTD =
{
	local string st;
	local string years;
	local float  yearsFlt;

	// PZ: Let's make it so that the number of years is automatically determined for us.
	// According to http://wiki.quakeworld.nu/CustomTF, which I'm pretty sure was written by Shaka, version 1.0
	// of CustomTF was released on 6/3/98 (June 3rd?).
	years = getlocaltime();
	yearsFlt = stof(years);
	yearsFlt = yearsFlt - 1998;
	years = ftos(yearsFlt);
	st = "Ÿ Celebrating *";
	st = strcat(st, years);
	st = strcat(st, "* years!! Ÿ\n\n");
	
	if ((self.#cprint_fx & 3) == 3)
		st = colstr(st,#COLSTR_MIX1);
	else if (self.#cprint_fx & 2)
		st = colstr(st,#COLSTR_RED);
	else if (self.#cprint_fx & 1)
		st = colstr(st,#COLSTR_MIX2);
	
	CenterPrint4(self,#MSG_INTRO,#MSG_INTRO2,st,#MSG_INTRO3);

	self.#cprint_fx = self.#cprint_fx + 1;
};

void() PrintProzacIntro =
{
	if (!no_votemap && !no_punish)
		sprint(self,#PRINT_HIGH,"\nVoting You can issue a vote by using the ¢VoteMap¢ and ¢Punish¢ aliases.\n");
	else
	{
		if (!no_punish)
			sprint(self,#PRINT_HIGH,"\nVoting You can issue a vote by using ¢VoteMap¢ alias.\n");
		else if (!no_votemap)
			sprint(self,#PRINT_HIGH,"\nVoting You can issue a vote by using ¢Punish¢ alias.\n");
	}

	//sprint(self, #PRINT_HIGH, #MSG_INFO, "\n",#MSG_OFTEN_CUTFVERSION, "\nŸ ", #MSG_CUTFVERSION, " Ÿ\n       Éîæïòíáôéïî èïíåğáçå:\n     www®telefragged®com¯shaka\nŸ\n\n");
	// PZ: Changed from www.customtf.org/forums to quakeworld.nu/wiki/Prozac-TF, and added Prozac Discord invitation link.
	sprint(self, #PRINT_HIGH, #MSG_INFO, "\n",#MSG_OFTEN_CUTFVERSION, "\nŸ ", #MSG_CUTFVERSION, " Ÿ\n          Éîæïòíáôéïî èïíåğáçå:\n       quakeworld®nu¯wiki¯Prozac-TF\n            discord®gg¯fp9sSZ5\nŸ\n\n");

	// PZ - Attackers Go Red mode
	if (agr) { AGR_introducePlayer(); sprint(self, #PRINT_HIGH, "\n"); }

	// for Neo mode
	if (neo) { Neo_introducePlayer(); sprint(self, #PRINT_HIGH, "\n"); }
};
