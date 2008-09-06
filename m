From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Sep 2008 13:49:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/festival:
	festival speech-tools
Message-ID: <20080906204925.7A39C3C6A7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-06 13:49:25 -0700 (Sat, 06 Sep 2008)
New Revision: 23344

Log:
festival: fix path in AUTOTARGETS (broken by r23330)

Modified:
   trunk/buildroot/package/audio/festival/festival/festival.mk
   trunk/buildroot/package/audio/festival/speech-tools/speech-tools.mk


Changeset:
Modified: trunk/buildroot/package/audio/festival/festival/festival.mk
===================================================================
--- trunk/buildroot/package/audio/festival/festival/festival.mk	2008-09-06 20:49:21 UTC (rev 23343)
+++ trunk/buildroot/package/audio/festival/festival/festival.mk	2008-09-06 20:49:25 UTC (rev 23344)
@@ -17,5 +17,5 @@
 
 FESTIVAL_DEPENDENCIES = uclibc alsa-lib speech-tools
 
-$(eval $(call AUTOTARGETS,package/festival,festival))
+$(eval $(call AUTOTARGETS,package/audio/festival,festival))
 

Modified: trunk/buildroot/package/audio/festival/speech-tools/speech-tools.mk
===================================================================
--- trunk/buildroot/package/audio/festival/speech-tools/speech-tools.mk	2008-09-06 20:49:21 UTC (rev 23343)
+++ trunk/buildroot/package/audio/festival/speech-tools/speech-tools.mk	2008-09-06 20:49:25 UTC (rev 23344)
@@ -16,5 +16,5 @@
 
 SPEECH_TOOLS_DEPENDENCIES = uclibc ncurses
 
-$(eval $(call AUTOTARGETS,package/festival,speech-tools))
+$(eval $(call AUTOTARGETS,package/audio/festival,speech-tools))
 
