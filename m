From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 22:20:51 +0200
Subject: [Buildroot] [git commit] configs/mx53loco: Adjust comment to
 reflect the real kernel version
Message-ID: <20180517202001.33C7A88EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5ff200b0df12babdf22658ddd386498f5ccd69f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel used is from 4.16 version, so adjust the comment.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/mx53loco_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 16dde351bd..ae56fcad8c 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -2,7 +2,7 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 4.15 series
+# Linux headers same as kernel, a 4.16 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # System
