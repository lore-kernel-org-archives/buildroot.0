From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:04:29 +0200
Subject: [Buildroot] [git commit] linux: remove Blackfin related code
Message-ID: <20180415200629.1BCBB886C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e55f21a9520dda5d39eaad728c9d0fcc30004f5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index ac1727d859..033ccbe58e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -194,7 +194,7 @@ choice
 
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
-	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
+	depends on BR2_arc || BR2_arm || BR2_armeb || \
 		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
 		   BR2_sh || BR2_mips || BR2_mipsel || \
 		   BR2_mips64 || BR2_mips64el || BR2_xtensa
