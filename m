From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Jun 2011 09:12:52 +0200
Subject: [Buildroot] [git commit] sheevaplug_defconfig: bump kernel version
Message-ID: <20110626071724.94DC488E22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b93c609f118aa8e7c9c0b489f5f124507bdaf6e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/sheevaplug_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 757e1f5..305aadd 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -19,6 +19,6 @@ BR2_TARGET_UBOOT_FORMAT_KWB=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39.2"
 BR2_LINUX_KERNEL_DEFCONFIG="kirkwood"
 BR2_LINUX_KERNEL_UIMAGE=y
-- 
1.7.3.4
