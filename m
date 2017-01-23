From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 22:58:25 +0100
Subject: [Buildroot] [git commit] raspberrypi0_defconfig: bump kernel
	version to 4.4.43
Message-ID: <20170123220845.081AE7FE47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=748acf396941d7335911948ae478ba16bd582701
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi0_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 2e03192..736143f 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -10,7 +10,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="c6d86f7aa554854b04614ebb4d394766081fb41f"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1ebe8d4a4c96cd6a90805c74233a468854960f67"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
