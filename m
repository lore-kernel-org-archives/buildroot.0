From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Fri,  4 Apr 2008 11:03:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/festival: festival
	speech-tools
Message-ID: <20080404180313.A1E1B3C415@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-04 11:03:12 -0700 (Fri, 04 Apr 2008)
New Revision: 21637

Log:
change festival url to stable version

Modified:
   trunk/buildroot/package/festival/festival/festival.mk
   trunk/buildroot/package/festival/speech-tools/speech-tools.mk


Changeset:
Modified: trunk/buildroot/package/festival/festival/festival.mk
===================================================================
--- trunk/buildroot/package/festival/festival/festival.mk	2008-04-04 14:16:06 UTC (rev 21636)
+++ trunk/buildroot/package/festival/festival/festival.mk	2008-04-04 18:03:12 UTC (rev 21637)
@@ -5,7 +5,7 @@
 #############################################################
 FESTIVAL_VERSION = 1.96-beta
 FESTIVAL_SOURCE = festival-$(FESTIVAL_VERSION).tar.gz
-FESTIVAL_SITE = http://festvox.org/packed/festival/latest
+FESTIVAL_SITE = http://festvox.org/packed/festival/1.96
 FESTIVAL_AUTORECONF = NO
 FESTIVAL_INSTALL_STAGING = NO
 FESTIVAL_INSTALL_TARGET = YES

Modified: trunk/buildroot/package/festival/speech-tools/speech-tools.mk
===================================================================
--- trunk/buildroot/package/festival/speech-tools/speech-tools.mk	2008-04-04 14:16:06 UTC (rev 21636)
+++ trunk/buildroot/package/festival/speech-tools/speech-tools.mk	2008-04-04 18:03:12 UTC (rev 21637)
@@ -5,7 +5,7 @@
 #############################################################
 SPEECH_TOOLS_VERSION = 1.2.96-beta
 SPEECH_TOOLS_SOURCE = speech_tools-$(SPEECH_TOOLS_VERSION).tar.gz
-SPEECH_TOOLS_SITE = http://festvox.org/packed/festival/latest
+SPEECH_TOOLS_SITE = http://festvox.org/packed/festival/1.96
 SPEECH_TOOLS_AUTORECONF = NO
 SPEECH_TOOLS_INSTALL_STAGING = NO
 SPEECH_TOOLS_INSTALL_TARGET = YES
