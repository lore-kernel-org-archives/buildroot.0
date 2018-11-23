From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 10:43:35 +0100
Subject: [Buildroot] [git commit] configs/riotboard: add missing dependency
 on host-openssl
Message-ID: <20181123094044.597597FB0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=255f22fa0a9d4f5e624fc95dfb9cdb992d9fca88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/123771135

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/riotboard_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 04d52eb4fa..3efcd8859d 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -27,6 +27,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-riotboard"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
