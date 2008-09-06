From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Sep 2008 13:49:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/festival
Message-ID: <20080906204912.C1A453C65A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-06 13:49:12 -0700 (Sat, 06 Sep 2008)
New Revision: 23340

Log:
festival: fix more paths (broken by r23330)

Patch by Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/audio/festival/Config.in


Changeset:
Modified: trunk/buildroot/package/audio/festival/Config.in
===================================================================
--- trunk/buildroot/package/audio/festival/Config.in	2008-09-06 20:49:08 UTC (rev 23339)
+++ trunk/buildroot/package/audio/festival/Config.in	2008-09-06 20:49:12 UTC (rev 23340)
@@ -8,15 +8,15 @@
 if BR2_PACKAGE_FESTIVAL
 
 	menu "speech tools"
-		source "package/festival/speech-tools/Config.in"
+		source "package/audio/festival/speech-tools/Config.in"
 	endmenu
 
 	menu "festival lexicons"
-		source "package/festival/lexicons/Config.in"
+		source "package/audio/festival/lexicons/Config.in"
 	endmenu
 
 	menu "festival voices"
-		source "package/festival/voices/Config.in"
+		source "package/audio/festival/voices/Config.in"
 	endmenu
 
 endif
