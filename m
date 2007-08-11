From: andersen at uclibc.org <andersen@uclibc.org>
Date: Fri, 10 Aug 2007 17:12:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7
Message-ID: <20070811001235.DFC1EA5D30@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-08-10 17:12:33 -0700 (Fri, 10 Aug 2007)
New Revision: 19425

Log:
doh, missed a spot


Added:
   trunk/buildroot/package/x11r7/x11r7.mk


Changeset:
Added: trunk/buildroot/package/x11r7/x11r7.mk
===================================================================
--- trunk/buildroot/package/x11r7/x11r7.mk	                        (rev 0)
+++ trunk/buildroot/package/x11r7/x11r7.mk	2007-08-11 00:12:33 UTC (rev 19425)
@@ -0,0 +1,2 @@
+include package/x11r7/*/*.mk
+
