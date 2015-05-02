From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 23:53:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/libatomic_ops: bump version to 7.4.2
Message-ID: <1430603605-27408-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add project URL to Config.in

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libatomic_ops/Config.in        |    2 ++
 package/libatomic_ops/libatomic_ops.mk |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index fe1efd4..a515bb8 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -7,3 +7,5 @@ config BR2_PACKAGE_LIBATOMIC_OPS
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
 	help
 	  Atomic operations library
+
+	  https://github.com/ivmai/libatomic_ops
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 6a26775..5f698c4 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = libatomic_ops-7_4_0
+LIBATOMIC_OPS_VERSION = libatomic_ops-7_4_2
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
-- 
1.7.10.4
