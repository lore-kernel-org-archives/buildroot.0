From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 21 Feb 2009 13:04:03 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/libsndfile
Message-ID: <20090221130404.4E2B076564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-21 13:04:02 +0000 (Sat, 21 Feb 2009)
New Revision: 25407

Log:
libsndfile: cleanup help text

Modified:
   trunk/buildroot/package/multimedia/libsndfile/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/libsndfile/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/libsndfile/Config.in	2009-02-21 09:06:48 UTC (rev 25406)
+++ trunk/buildroot/package/multimedia/libsndfile/Config.in	2009-02-21 13:04:02 UTC (rev 25407)
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_LIBSNDFILE
 	bool "libsndfile"
 	help
-	    Libsndfile is a C library for reading and writing files containing
-	    sampled sound (such as MS Windows WAV and the Apple/SGI AIFF format)
-	    through one standard library interface.
+	  Libsndfile is a C library for reading and writing files containing
+	  sampled sound (such as MS Windows WAV and the Apple/SGI AIFF format)
+	  through one standard library interface.
 
+	  http://www.mega-nerd.com/libsndfile/
