From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 10:54:51 +0100
Subject: [Buildroot] [git commit] package/libnspr: allow building for Arc
 Architecture
Message-ID: <20191229094541.A66968E694@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fd3cd877305304e84ddebdb2d2e8f815f976187
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Arc architecture is now supported by NSPR so let's allow to build for
it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnspr/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 1d95155248..57fcbdf6be 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	def_bool y
-	depends on !BR2_arc && !BR2_xtensa
+	depends on !BR2_xtensa
 
 if BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 
