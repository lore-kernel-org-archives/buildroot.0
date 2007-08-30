From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 30 Aug 2007 15:40:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mplayer
Message-ID: <20070830224024.99429A464D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-30 15:40:22 -0700 (Thu, 30 Aug 2007)
New Revision: 19738

Log:
- mark duplicate hunk


Modified:
   trunk/buildroot/package/mplayer/mplayer-1.0rc1-atmel.2.patch


Changeset:
Modified: trunk/buildroot/package/mplayer/mplayer-1.0rc1-atmel.2.patch
===================================================================
--- trunk/buildroot/package/mplayer/mplayer-1.0rc1-atmel.2.patch	2007-08-30 06:00:36 UTC (rev 19737)
+++ trunk/buildroot/package/mplayer/mplayer-1.0rc1-atmel.2.patch	2007-08-30 22:40:22 UTC (rev 19738)
@@ -111,6 +111,7 @@
  
  
  echocheck "X11 headers presence"
+Note that this hunk is a dulicate between the other patch
 -  for I in `echo $_inc_extra | sed s/-I//g` /usr/X11/include /usr/X11R6/include /usr/include/X11R6 /usr/include /usr/openwin/include ; do
 +  for I in `echo $_inc_extra | sed s/-I//g`; do
      if test -f "$I/X11/Xlib.h" ; then
