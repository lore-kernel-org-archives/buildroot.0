From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Sep 2008 13:49:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/festival
Message-ID: <20080906204909.6466B3C360@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-06 13:49:08 -0700 (Sat, 06 Sep 2008)
New Revision: 23339

Log:
festival: fix paths (broken by r23330)

Patch by Michel Wilson <michel@crondor.net>

Modified:
   trunk/buildroot/package/audio/festival/festival.mk


Changeset:
Modified: trunk/buildroot/package/audio/festival/festival.mk
===================================================================
--- trunk/buildroot/package/audio/festival/festival.mk	2008-09-06 16:45:07 UTC (rev 23338)
+++ trunk/buildroot/package/audio/festival/festival.mk	2008-09-06 20:49:08 UTC (rev 23339)
@@ -1,4 +1,4 @@
-include package/festival/speech-tools/speech-tools.mk
-include package/festival/festival/festival.mk
-include package/festival/voices/festvox.mk
-include package/festival/lexicons/festlex.mk
+include package/audio/festival/speech-tools/speech-tools.mk
+include package/audio/festival/festival/festival.mk
+include package/audio/festival/voices/festvox.mk
+include package/audio/festival/lexicons/festlex.mk
