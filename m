From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 08:52:25 +0200
Subject: [Buildroot] [git commit] raspberrypi_defconfig: bump to kernel
	version 4.4.8
Message-ID: <20160428070645.49B9780809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbd4284f20603da29764c870ad42e16a096434c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Mauduit <bmauduit@beneth.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 70818c9..422426b 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -12,7 +12,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3de232825c9ba5989522b8691eb6ac5df6619458"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="26f3b72a9c049be10e6af196252283e1f6ab9d1f"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
