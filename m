From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 23:26:40 +0200
Subject: [Buildroot] [git commit] configs/odroidc2: bump uboot to rev
	1ec799cec97574a9838bc25b286484e579a41652
Message-ID: <20160723212652.172C781D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e357926adc855d3e07a7eb35d43fd57322ebdc48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/odroidc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 1945983..30fa2d5 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -26,7 +26,7 @@ BR2_LINUX_KERNEL_IMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="f416a769454b89c39d5b217d28bd3c9f5d1594df"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1ec799cec97574a9838bc25b286484e579a41652"
 BR2_TARGET_UBOOT_BOARDNAME="odroidc2"
 
 # Required tools to create the SD image
