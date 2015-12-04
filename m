From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Dec 2015 21:40:29 +0100
Subject: [Buildroot] [git commit] libatomic_ops: enable sparc64 / sparcv9
Message-ID: <20151204205653.B9329821B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0120c71df95027d18202bdb2e6372b1a3a2aa0f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Works fine for sparc64.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libatomic_ops/Config.in | 2 +-
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
