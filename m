From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Jun 2008 06:40:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20080623134045.AD7CB3C2E4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-23 06:40:34 -0700 (Mon, 23 Jun 2008)
New Revision: 22480

Log:
README: s/standart/standard/


Modified:
   trunk/buildroot/docs/README


Changeset:
Modified: trunk/buildroot/docs/README
===================================================================
--- trunk/buildroot/docs/README	2008-06-23 13:24:19 UTC (rev 22479)
+++ trunk/buildroot/docs/README	2008-06-23 13:40:34 UTC (rev 22480)
@@ -35,7 +35,7 @@
 And you can specify a config-file for busybox:
 $ make BUSYBOX_CONFIG_FILE=/my/busybox.config
 
-To use a non-standart host-compiler (if you do not have 'gcc'),
+To use a non-standard host-compiler (if you do not have 'gcc'),
 make sure that the compiler is in your PATH and that the library paths are
 setup properly, if your compiler is built dynamically:
 $ make HOSTCC=gcc-4.3.orig HOSTCXX=gcc-4.3-mine
