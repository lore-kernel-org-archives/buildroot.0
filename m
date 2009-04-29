From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 29 Apr 2009 15:52:24 +0000 (UTC)
Subject: [Buildroot] svn commit: [26243] trunk/buildroot/package
Message-ID: <20090429155224.DF86A775F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-29 15:52:24 +0000 (Wed, 29 Apr 2009)
New Revision: 26243

Log:
package/: remove obsolete qte package


Removed:
   trunk/buildroot/package/qte/

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-04-29 13:12:56 UTC (rev 26242)
+++ trunk/buildroot/package/Config.in	2009-04-29 15:52:24 UTC (rev 26243)
@@ -313,7 +313,6 @@
 source "package/fbset/Config.in"
 
 comment "other GUIs"
-source "package/qte/Config.in"
 source "package/qtopia4/Config.in"
 
 #source "package/microwin/Config.in"
