From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  2 Sep 2007 13:58:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mutt
Message-ID: <20070902205852.8C4ACA681A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-02 13:58:51 -0700 (Sun, 02 Sep 2007)
New Revision: 19765

Log:
- it's a stub, add prominent note on it's brokenness


Modified:
   trunk/buildroot/package/mutt/Config.in


Changeset:
Modified: trunk/buildroot/package/mutt/Config.in
===================================================================
--- trunk/buildroot/package/mutt/Config.in	2007-09-02 20:53:38 UTC (rev 19764)
+++ trunk/buildroot/package/mutt/Config.in	2007-09-02 20:58:51 UTC (rev 19765)
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_MUTT
-	bool "mutt"
+	bool "mutt (BROKEN for wchar; FIXME!)"
 	default n
 	select BR2_PACKAGE_NCURSES
 	help
