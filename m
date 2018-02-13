From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 13 Feb 2018 09:39:38 +0100
Subject: [Buildroot] [PATCH v2 4/4] configs: add linux boot logo to
 raspberrypi3 defconfig
In-Reply-To: <1518511178-28623-1-git-send-email-angelo@amarulasolutions.com>
References: <1518511178-28623-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1518511178-28623-4-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch adds a custom boot up logo to the raspberrypi3
defconfig.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 configs/raspberrypi3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 9304f0c..849b30e 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="33ee56d5927ceff630fbc87e3f5caa409b6ae114"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH="docs/images/logo_linux_clut224.png"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.7.4
