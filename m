From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:18:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/stunnel
Message-ID: <20080827201858.706753C855@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:18:58 -0700 (Wed, 27 Aug 2008)
New Revision: 23253

Log:
stunnel: fix long help text lines

And add homepage while we're at it.

Modified:
   trunk/buildroot/package/stunnel/Config.in


Changeset:
Modified: trunk/buildroot/package/stunnel/Config.in
===================================================================
--- trunk/buildroot/package/stunnel/Config.in	2008-08-27 20:18:54 UTC (rev 23252)
+++ trunk/buildroot/package/stunnel/Config.in	2008-08-27 20:18:58 UTC (rev 23253)
@@ -1,4 +1,9 @@
 config BR2_PACKAGE_STUNNEL
 	bool "stunnel"
 	help
-	  Stunnel is a utility that utilised OpenSSL to wrap plaintext TCP communications with SSL. Can be used to secure a programmes insecure network communications.
+	  Stunnel is a utility that utilised OpenSSL to wrap plaintext
+	  TCP communications with SSL. Can be used to secure a
+	  programmes insecure network communications.
+
+	  http://www.stunnel.org/
+
