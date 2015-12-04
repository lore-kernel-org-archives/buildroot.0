From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 4 Dec 2015 06:34:06 +0100
Subject: [Buildroot] [PATCH] libatomic_ops: enable sparc64 / sparcv9
Message-ID: <20151204053406.GA16004@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Works fine for sparc64.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libatomic_ops/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index a515bb8..73aab3d 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64
+	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_sparc64 || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64
 
 config BR2_PACKAGE_LIBATOMIC_OPS
 	bool "libatomic_ops"
-- 
1.7.10.4
