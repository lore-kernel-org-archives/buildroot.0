From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon, 16 Jun 2008 22:29:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libvorbis
Message-ID: <20080617052948.6FCE53C853@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-06-16 22:29:48 -0700 (Mon, 16 Jun 2008)
New Revision: 22387

Log:
Fix missing punctuation

Modified:
   trunk/buildroot/package/libvorbis/Config.in


Changeset:
Modified: trunk/buildroot/package/libvorbis/Config.in
===================================================================
--- trunk/buildroot/package/libvorbis/Config.in	2008-06-17 05:11:43 UTC (rev 22386)
+++ trunk/buildroot/package/libvorbis/Config.in	2008-06-17 05:29:48 UTC (rev 22387)
@@ -16,7 +16,7 @@
 	  WMA and PAC.
 
 config BR2_PACKAGE_LIBVORBIS_TREMOR
-	bool "use fixed point implementation (tremor)
+	bool "use fixed point implementation (tremor)"
 	default y if BR2_SOFT_FLOAT
 	default n
 	depends on BR2_PACKAGE_LIBVORBIS
