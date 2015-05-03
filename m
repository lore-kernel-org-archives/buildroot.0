From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 May 2015 19:31:39 +0200
Subject: [Buildroot] [git commit] package/libatomic_ops: bump version to
	7.4.2
Message-ID: <20150503173425.E350580836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2eb052b2f917558ac36998c74bb70907eb2d13a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add project URL to Config.in

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libatomic_ops/Config.in        |    2 ++
 package/libatomic_ops/libatomic_ops.mk |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
 
