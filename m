From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsamixergui
Message-ID: <20080827201934.C655EF8026@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:34 -0700 (Wed, 27 Aug 2008)
New Revision: 23263

Log:
alsamixergui: fix long help text lines

Select fltk and fix homepage link while we're at it.

Modified:
   trunk/buildroot/package/alsamixergui/Config.in


Changeset:
Modified: trunk/buildroot/package/alsamixergui/Config.in
===================================================================
--- trunk/buildroot/package/alsamixergui/Config.in	2008-08-27 20:19:30 UTC (rev 23262)
+++ trunk/buildroot/package/alsamixergui/Config.in	2008-08-27 20:19:34 UTC (rev 23263)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ALSAMIXERGUI
+	select BR2_PACKAGE_FLTK
 	bool "alsamixergui"
 	help
 	  A nice GUI mixer for Alsa using fltk
 
-	  http://snapshot.debian.net/archive/2008/03/19/debian/pool/main/a/alsamixergui
+	  http://www.iua.upf.es/~mdeboer/projects/alsamixergui/
