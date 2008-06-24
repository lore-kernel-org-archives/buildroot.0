From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Jun 2008 11:35:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080624183533.1A0503C66C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-24 11:35:32 -0700 (Tue, 24 Jun 2008)
New Revision: 22492

Log:
BR2_GRAPHIC_SUPPORT: Fixup comment to make kconfig happy

It seems like kconfig nowadays don't like paranthesises is comments.

Reported by Harley.


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-06-24 16:08:22 UTC (rev 22491)
+++ trunk/buildroot/package/Config.in	2008-06-24 18:35:32 UTC (rev 22492)
@@ -341,8 +341,8 @@
 source "package/sdl_ttf/Config.in"
 source "package/tiff/Config.in"
 
-comment "busybox graphic applications" 
-comment "--> (May be broken in busybox)"
+comment "busybox graphic applications"
+comment "--> May be broken in busybox"
 source "package/fbv/Config.in"
 source "package/fbset/Config.in"
 
