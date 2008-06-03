From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Jun 2008 03:17:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tslib
Message-ID: <20080603101746.6C1CA3C667@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-03 03:17:44 -0700 (Tue, 03 Jun 2008)
New Revision: 22200

Log:
tslib: fix inputattach patch typos

Patch by Markus Heidelberg.

tslib should be changed to use inputattach from the input-tools package
instead though.


Modified:
   trunk/buildroot/package/tslib/tslib_add_finddef_and_inputattach_utils.patch


Changeset:
Modified: trunk/buildroot/package/tslib/tslib_add_finddef_and_inputattach_utils.patch
===================================================================
--- trunk/buildroot/package/tslib/tslib_add_finddef_and_inputattach_utils.patch	2008-06-03 09:02:32 UTC (rev 22199)
+++ trunk/buildroot/package/tslib/tslib_add_finddef_and_inputattach_utils.patch	2008-06-03 10:17:44 UTC (rev 22200)
@@ -115,11 +115,11 @@
 +#endif
 +#ifndef SERIO_SUNKBD
 +  #define SERIO_SUNKBD    0x10
-+#endif SERIO_SUNKBD
++#endif
 +#ifndef SERIO_WARRIOR
 +  #define SERIO_WARRIOR   0x18
 +#endif
-+#ifndef SERIO_WARRIOR
++#ifndef SERIO_SPACEORB
 +  #define SERIO_SPACEORB  0x19
 +#endif
 +#ifndef SERIO_MAGELLAN
