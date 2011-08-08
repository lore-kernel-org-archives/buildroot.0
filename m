From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Aug 2011 18:56:47 +0200
Subject: [Buildroot] [git commit] sheevaplug_defconfig: use 2.6.39.4
Message-ID: <20110808170324.EC82D8B85B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=db685acb529c0c7f49abdb8567b93c172ba92d59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/sheevaplug_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 3ba568e..86389dd 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -19,6 +19,6 @@ BR2_TARGET_UBOOT_FORMAT_KWB=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39.4"
 BR2_LINUX_KERNEL_DEFCONFIG="kirkwood"
 BR2_LINUX_KERNEL_UIMAGE=y
-- 
1.7.3.4
