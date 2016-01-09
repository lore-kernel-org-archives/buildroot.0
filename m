From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  9 Jan 2016 20:42:28 +0100
Subject: [Buildroot] [PATCH 2/2] package/lttng-modules: bump to version 2.7.1
In-Reply-To: <1452368548-5465-1-git-send-email-s.martin49@gmail.com>
References: <1452368548-5465-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1452368548-5465-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
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
-- 
2.7.0
