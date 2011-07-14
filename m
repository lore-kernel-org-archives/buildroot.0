From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Jul 2011 13:43:37 +0200
Subject: [Buildroot] [git commit] sheevaplug_defconfig: use 2.6.39.3
Message-ID: <20110714114411.A09178A5AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e48d8ba57d59d4400251a526ee9c03fa0b07c36f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/sheevaplug_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 305aadd..3ba568e 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -19,6 +19,6 @@ BR2_TARGET_UBOOT_FORMAT_KWB=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39.3"
 BR2_LINUX_KERNEL_DEFCONFIG="kirkwood"
 BR2_LINUX_KERNEL_UIMAGE=y
-- 
1.7.3.4
