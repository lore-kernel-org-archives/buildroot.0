From: Dagg <daggs@gmx.com>
Date: Wed,  1 Jun 2016 13:27:19 +0300
Subject: [Buildroot] [PATCH 2/3] select libamlogic for odroidc2 boards
In-Reply-To: <20160601102720.3929-1-daggs@gmx.com>
References: <20160601102720.3929-1-daggs@gmx.com>
Message-ID: <20160601102720.3929-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg <daggs@gmx.com>
---
 configs/odroidc2_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 1945983..960b2d1 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -22,6 +22,9 @@ BR2_LINUX_KERNEL_USE_INTREE_DTS=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="meson64_odroidc2"
 BR2_LINUX_KERNEL_IMAGE=y
 
+# Media
+BR2_PACKAGE_LIBAMCODEC=y
+
 # U-Boot
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-- 
2.8.3
