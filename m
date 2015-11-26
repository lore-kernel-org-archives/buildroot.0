From: eeppeliteloop at gmail.com <eeppeliteloop@gmail.com>
Date: Thu, 26 Nov 2015 14:42:05 -0500
Subject: [Buildroot] [PATCH 3/3] lttng-modules: bump to version 2.7.0
In-Reply-To: <1448566925-4643-1-git-send-email-eeppeliteloop@gmail.com>
References: <1448566925-4643-1-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <1448566925-4643-4-git-send-email-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Philippe Proulx <eeppeliteloop@gmail.com>

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/lttng-modules/lttng-modules.hash | 5 +++--
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index 918b4cf..b1a14e8 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,2 +1,3 @@
-# http://www.lttng.org/files/lttng-modules/lttng-modules-2.6.0.tar.bz2.sha1
-sha1  6402ec848e2a75250e04be35f0c49332bf37a388  lttng-modules-2.6.0.tar.bz2
+# http://www.lttng.org/files/lttng-modules/lttng-modules-2.7.0.tar.bz2.sha1
+sha1  b98b85cd71c03d511b37790644353c7209bcadd4  lttng-modules-2.7.0.tar.bz2
+
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
-- 
2.6.2
