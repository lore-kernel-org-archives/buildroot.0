From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Tue, 3 Jun 2008 10:11:22 +0200
Subject: [Buildroot] [PATCH] fix tslib inputattach
Message-ID: <200806031011.23006.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this fixes two errors in the inputattach patch for the package tslib.

Markus

---

Index: package/tslib/tslib_add_finddef_and_inputattach_utils.patch
===================================================================
--- package/tslib/tslib_add_finddef_and_inputattach_utils.patch	(revision 22197)
+++ package/tslib/tslib_add_finddef_and_inputattach_utils.patch	(working copy)
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
