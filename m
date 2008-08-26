From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 15:37:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/atk
Message-ID: <20080826223724.5DCF33C780@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 15:37:23 -0700 (Tue, 26 Aug 2008)
New Revision: 23227

Log:
atk: remove redundant configure args

Modified:
   trunk/buildroot/package/atk/atk.mk


Changeset:
Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2008-08-26 22:37:20 UTC (rev 23226)
+++ trunk/buildroot/package/atk/atk.mk	2008-08-26 22:37:23 UTC (rev 23227)
@@ -50,14 +50,7 @@
 ATK_CONF_OPT_X = --without-x
 endif
 
-ATK_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(REAL_GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--exec-prefix=/usr --bindir=/usr/bin \
-		--sbindir=/usr/sbin --libdir=/usr/lib \
-		--libexecdir=/usr/lib --sysconfdir=/etc \
-		--datadir=/usr/share --localstatedir=/var \
-		--includedir=/usr/include --mandir=/usr/man \
-		--infodir=/usr/info --enable-shared \
+ATK_CONF_OPT =  --enable-shared \
 		--enable-static $(ATK_CONF_OPT_X) \
 		--disable-glibtest --enable-explicit-deps=no \
 		--disable-debug
