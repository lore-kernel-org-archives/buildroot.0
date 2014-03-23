From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 22:50:31 +0100
Subject: [Buildroot] [git commit] lttng-modules: bump version to 2.4.0
Message-ID: <20140323221922.060029C24A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34c3d4f41f6d333903b3d9ac8a4d6a6fe311b36a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-modules/lttng-modules.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index baa421e..ca51e87 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.2.0
+LTTNG_MODULES_VERSION = 2.4.0
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
