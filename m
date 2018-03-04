From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Mar 2018 22:31:24 +0100
Subject: [Buildroot] [PATCH 10/23] configs/mx53loco: needs host-openssl for
 the Linux kernel build
In-Reply-To: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
References: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180304213137.24681-11-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306856

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/mx53loco_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index aaba4767ed..8bb4014178 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -32,3 +32,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.1"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx53-qsb imx53-qsrb"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.14.3
