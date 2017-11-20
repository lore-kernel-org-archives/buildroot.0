From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Mon, 20 Nov 2017 18:20:04 -0500
Subject: [Buildroot] [PATCH 1/3] lttng-modules: bump version to 2.10.4
Message-ID: <20171120232006.22588-1-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/lttng-modules/lttng-modules.hash | 6 +++---
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index 6849d5d6a6..7fa742dc11 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,3 +1,3 @@
-# From http://lttng.org/files/lttng-modules/lttng-modules-2.9.2.tar.bz2.{md5,sha1}
-md5 6c02645c77fd4d6475a4f83bda1d75ff  lttng-modules-2.9.2.tar.bz2
-sha1 da54a8478019c0d551590c37826e78c058e9cb8b  lttng-modules-2.9.2.tar.bz2
+# From http://lttng.org/files/lttng-modules/lttng-modules-2.10.4.tar.bz2.{md5,sha1}
+md5 832452b321a4df6836549e72d05b2ce9  lttng-modules-2.10.4.tar.bz2
+sha1 1712f5d5c0ef9b028949693c5cf24c5a00b7f4ef  lttng-modules-2.10.4.tar.bz2
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index f53b085597..4a4974d81d 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.9.2
+LTTNG_MODULES_VERSION = 2.10.4
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
-- 
2.15.0
