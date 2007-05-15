From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 15 May 2007 02:45:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20070515094521.EA9DB4801E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-15 02:45:21 -0700 (Tue, 15 May 2007)
New Revision: 18620

Log:
Don't use libssp as it doesn't get installed

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-05-15 09:33:57 UTC (rev 18619)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-05-15 09:45:21 UTC (rev 18620)
@@ -135,6 +135,7 @@
 		--disable-pygtk \
 		--disable-mono \
 		--disable-monodoc \
+		--disable-stack-protector \
 		--with-distro=none \
 		--with-avahi-user=default \
 		--with-avahi-group=default \
