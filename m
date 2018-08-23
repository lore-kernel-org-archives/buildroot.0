From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 21:45:36 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] lttng-modules: bump
 version to 2.10.6
Message-ID: <20180823194109.3B30E8E426@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=078dd40b2f7aaa289c3d444dfc59db7f46e8d537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

This is needed for kernel 2.16.x compatiblity.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dda7a906248e7bed53055797222c69b449f02c47)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
