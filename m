From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jul 2013 23:24:12 +0200
Subject: [Buildroot] [PATCH 1/4] defconfig/rpi: bump kernel for misc fixes
In-Reply-To: <cover.1374182572.git.yann.morin.1998@free.fr>
References: <cover.1374182572.git.yann.morin.1998@free.fr>
Message-ID: <b70a2ed90c7068be35a49a17119fcd08fc6f806d.1374182572.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump for a few fixes:
  - fix for slow SDcards
  - fix for USB interrupts
  - fix for tracing functions

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/rpi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
index 3df440f..9d608f1 100644
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -17,7 +17,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.6.11"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="53f7e0b"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="0006326"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.8.1.2
