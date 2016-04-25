From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 14:07:58 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel version
	with rpi/rpi2
Message-ID: <20160425120824.37E1F7FD4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8c221b08b864f1b9f6bb7b0eb06d3173b71d2e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move to 4.4 series.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi3_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 80ce908..b30de43 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -7,13 +7,13 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="20fe468af4bb40fec0f81753da4b20a8bfc259c9"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3de232825c9ba5989522b8691eb6ac5df6619458"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
