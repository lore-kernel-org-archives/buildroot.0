From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 22:13:12 +0100
Subject: [Buildroot] [git commit] package/lttng-modules: bump to version
	2.7.1
Message-ID: <20160113211741.3AE037FDDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbb2f8bf32b93377daae8d020848b6ab8b77a014
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-modules/lttng-modules.hash | 4 ++--
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index b94d910..2d50287 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,2 +1,2 @@
-# http://www.lttng.org/files/lttng-modules/lttng-modules-2.7.0.tar.bz2.sha1
-sha1  b98b85cd71c03d511b37790644353c7209bcadd4  lttng-modules-2.7.0.tar.bz2
+# from http://lttng.org/files/lttng-tools/lttng-modules-2.7.1.tar.bz2.sha1
+sha1  38c42ec89b4966c7a4cc04aea75f5841634d8d66  lttng-modules-2.7.1.tar.bz2
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index a4e1461..5d0c422 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.7.0
+LTTNG_MODULES_VERSION = 2.7.1
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
