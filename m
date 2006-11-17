From: andersen at uclibc.org <andersen@uclibc.org>
Date: Fri, 17 Nov 2006 14:58:29 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qte
Message-ID: <20061117225829.D62FD4862B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-11-17 14:58:29 -0800 (Fri, 17 Nov 2006)
New Revision: 16572

Log:
fix missing dependancy for BR2_QTE_TMAKE_VERSION


Modified:
   trunk/buildroot/package/qte/Config.in


Changeset:
Modified: trunk/buildroot/package/qte/Config.in
===================================================================
--- trunk/buildroot/package/qte/Config.in	2006-11-17 20:29:00 UTC (rev 16571)
+++ trunk/buildroot/package/qte/Config.in	2006-11-17 22:58:29 UTC (rev 16572)
@@ -151,6 +151,7 @@
 config BR2_QTE_TMAKE_VERSION
         string
 	default "1.13"
+	depends BR2_PACKAGE_QTE
 
 # generated from:
 # ls ~/src/buildroot/build_arm/qt-2.3.10/configs/*-static|cut -c56-|sed -e 's/-static//g'|\
