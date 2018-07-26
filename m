From: Trent Piepho <tpiepho@impinj.com>
Date: Thu, 26 Jul 2018 16:33:19 -0700
Subject: [Buildroot] [PATCH 1/2] lttng-modules: bump version to 2.10.6
Message-ID: <20180726233320.1265-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed for kernel 2.16.x compatiblity.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 package/lttng-modules/lttng-modules.hash | 6 +++---
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index 7fa742dc11..8992cbce99 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,3 +1,3 @@
-# From http://lttng.org/files/lttng-modules/lttng-modules-2.10.4.tar.bz2.{md5,sha1}
-md5 832452b321a4df6836549e72d05b2ce9  lttng-modules-2.10.4.tar.bz2
-sha1 1712f5d5c0ef9b028949693c5cf24c5a00b7f4ef  lttng-modules-2.10.4.tar.bz2
+# From http://lttng.org/files/lttng-modules/lttng-modules-2.10.6.tar.bz2.{md5,sha1}
+md5 8110099f4615fc89a74ffe9189b56cfc  lttng-modules-2.10.6.tar.bz2
+sha1 1126b29e055ebdb3fad9201edaf0ef27f88c9369  lttng-modules-2.10.6.tar.bz2
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 4a4974d81d..8d48c37bac 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.10.4
+LTTNG_MODULES_VERSION = 2.10.6
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
-- 
2.14.4
