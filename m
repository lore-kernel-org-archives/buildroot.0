From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 13 Dec 2007 04:01:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20071213120151.4B2AD1200F2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-13 04:01:48 -0800 (Thu, 13 Dec 2007)
New Revision: 20645

Log:
delete haserl-0.9.20-legacy.patch

Removed:
   trunk/buildroot/package/haserl/haserl-0.9.20-legacy.patch


Changeset:
Deleted: trunk/buildroot/package/haserl/haserl-0.9.20-legacy.patch
===================================================================
--- trunk/buildroot/package/haserl/haserl-0.9.20-legacy.patch	2007-12-13 11:34:27 UTC (rev 20644)
+++ trunk/buildroot/package/haserl/haserl-0.9.20-legacy.patch	2007-12-13 12:01:48 UTC (rev 20645)
@@ -1,12 +0,0 @@
-diff -urN haserl-0.9.20-0rig/src/haserl.c haserl-0.9.20/src/haserl.c
---- haserl-0.9.20-0rig/src/haserl.c	2007-10-30 22:58:00.000000000 +0100
-+++ haserl-0.9.20/src/haserl.c	2007-10-30 23:00:10.000000000 +0100
-@@ -210,7 +210,7 @@
-     }
-   memcpy ((char *) (entry + strlen (prefix)), str, strlen (str));
- 
--  keylen = (size_t) (index (entry, '=') - entry);
-+  keylen = (size_t) (strchr (entry, '=') - entry);
- 
-   if (keylen <= 0)
-     {
