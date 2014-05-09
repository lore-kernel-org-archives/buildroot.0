From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 May 2014 16:30:01 +0200
Subject: [Buildroot] [git commit] configs: bump kernel used for the RPi
Message-ID: <20140509143214.073EE9CB24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c87bb5f5d676442110e0e0b4f0627df4620f1228
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes some USB-related bugs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 4fba6c7..d0c5813 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -16,7 +16,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="81bd944c02f65f706ad257f113fd5b2f62cdd03f"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="b09a27249d61475e4423607f7632a5aa6e7b3a53"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
