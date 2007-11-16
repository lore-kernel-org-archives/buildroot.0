From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri, 16 Nov 2007 08:10:26 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20071116161026.90B83A466D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-16 08:10:25 -0800 (Fri, 16 Nov 2007)
New Revision: 20441

Log:
fix 0001595 issue

Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2007-11-16 15:35:14 UTC (rev 20440)
+++ trunk/buildroot/package/directfb/directfb.mk	2007-11-16 16:10:25 UTC (rev 20441)
@@ -68,6 +68,7 @@
 		--enable-freetype \
 		--disable-sysfs \
 		--disable-sdl \
+		--disable-vnc \
 		--disable-video4linux \
 		--disable-video4linux2 \
 		--enable-fusion )
