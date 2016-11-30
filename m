From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:04:26 +0100
Subject: [Buildroot] [git commit] lttng-modules: bump version to 2.9.0
Message-ID: <20161202080021.544EA81E88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49ad7e6a696979165c0441c22df2b1d5dcac8658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
  https://lists.lttng.org/pipermail/lttng-dev/2016-November/026760.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-modules/lttng-modules.hash | 6 +++---
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index ce725ec..d8314f6 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,3 +1,3 @@
-# From http://lttng.org/files/lttng-modules/lttng-modules-2.8.3.tar.bz2.{md5,sha1}
-md5   424354c4834d20235dacd9a1fd7653b6  lttng-modules-2.8.3.tar.bz2
-sha1  862705784a54962f70226004f1fd0bf77f73f10f  lttng-modules-2.8.3.tar.bz2
+# From http://lttng.org/files/lttng-modules/lttng-modules-2.9.0.tar.bz2.{md5,sha1}
+md5 717df375ccb6f32bb297cc2f2e692bbf  lttng-modules-2.9.0.tar.bz2
+sha1 819ee1c2a5a821b7fdc1c2fc102ef3079c32aad7  lttng-modules-2.9.0.tar.bz2
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 9ecf572..aa0ac30 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.8.3
+LTTNG_MODULES_VERSION = 2.9.0
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
