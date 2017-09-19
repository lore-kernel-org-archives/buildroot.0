From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 19 Sep 2017 13:03:54 +0200
Subject: [Buildroot] [PATCH 4/4] configs: add linux boot logo to
	raspberrypi3 defconfig
In-Reply-To: <1505819034-29610-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1505819034-29610-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1505819034-29610-5-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a custom boot up logo to the raspberrypi3
defconfig.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 configs/raspberrypi3_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index fd35c53..44b86d1 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -14,6 +14,8 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9126e25b0934bd7bd843763310ea4b34c6e139d0"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+BR2_LINUX_KERNEL_CUSTOMLOGO=y
+BR2_LINUX_KERNEL_CUSTOMLOGO_PATH="docs/images/logo_linux_clut224.ppm"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.7.4
