From: Dagg Stompler <daggs@gmx.com>
Date: Sun, 24 Jul 2016 19:35:05 +0300
Subject: [Buildroot] [PATCH 2/3] odroid: select odroid-scripts for odroidc2
	defconfig
In-Reply-To: <20160724163506.20024-1-daggs@gmx.com>
References: <20160724163506.20024-1-daggs@gmx.com>
Message-ID: <20160724163506.20024-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 configs/odroidc2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 43c2787..45ede62 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -6,6 +6,7 @@ BR2_TARGET_GENERIC_HOSTNAME="odroidc2"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"
+BR2_PACKAGE_ODROID_SCRIPTS=y
 
 # Kernel
 BR2_KERNEL_HEADERS_VERSION=y
-- 
2.9.2
