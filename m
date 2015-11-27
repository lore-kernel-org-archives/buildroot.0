From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 13:19:29 +0100
Subject: [Buildroot] [git commit] lttng-modules: bump to version 2.7.0
Message-ID: <20151201232123.1079681952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2be38b9e3bee22129b9da160a8d131ce4e1efac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop extra whitespace in .hash file]
Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-modules/lttng-modules.hash | 4 ++--
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index 918b4cf..b94d910 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,2 +1,2 @@
-# http://www.lttng.org/files/lttng-modules/lttng-modules-2.6.0.tar.bz2.sha1
-sha1  6402ec848e2a75250e04be35f0c49332bf37a388  lttng-modules-2.6.0.tar.bz2
+# http://www.lttng.org/files/lttng-modules/lttng-modules-2.7.0.tar.bz2.sha1
+sha1  b98b85cd71c03d511b37790644353c7209bcadd4  lttng-modules-2.7.0.tar.bz2
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 30c581e..19c0a5d 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.6.0
+LTTNG_MODULES_VERSION = 2.7.0
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
