From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:58:12 +0100
Subject: [Buildroot] [git commit] raspberrypi3_defconfig: bump kernel
	version to 4.4.36
Message-ID: <20161204145926.7BCCB801B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8b842a784cde9c2242a4d9b7e063a3491643b78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 433c0d7..4cd046d 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -13,7 +13,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9669a50a3a8e4f33b4fe138277bc4407e1eab9b2"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="c6d86f7aa554854b04614ebb4d394766081fb41f"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
