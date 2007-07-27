From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 27 Jul 2007 06:08:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070727130847.195ABA47AD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-27 06:08:47 -0700 (Fri, 27 Jul 2007)
New Revision: 19277

Log:
- ignore itanium*


Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-07-27 12:47:58 UTC (rev 19276)
+++ trunk/buildroot/Config.in	2007-07-27 13:08:47 UTC (rev 19277)
@@ -398,8 +398,8 @@
 	default pca56		if BR2_alpha_21164pc
 	default ev6		if BR2_alpha_21264
 	default ev67		if BR2_alpha_21264a
-	default itanium		if BR2_ia64_itanium1
-	default itanium2	if BR2_ia64_itanium2
+#	default itanium		if BR2_ia64_itanium1
+#	default itanium2	if BR2_ia64_itanium2
 	default 68000		if BR2_m68k_68000
 	default 68010		if BR2_m68k_68010
 	default 68020		if BR2_m68k_68020
