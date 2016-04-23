From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Apr 2016 21:24:17 +0200
Subject: [Buildroot] [git commit] raspberrypi2_defconfig: bump to kernel
	version 4.4.7
Message-ID: <20160423192429.2790F80676@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83e53dbb1badfc3d9a3a1d99b9b5e193103c5b85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi2_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 7fc39c2..69a5403 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -7,13 +7,13 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d33d0293e245badc4ca6ede3984d8bb8ea63cb1a"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3de232825c9ba5989522b8691eb6ac5df6619458"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
