From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Wed, 25 Sep 2013 12:07:51 -0700
Subject: [Buildroot] [PATCH 3/4] nitrogen6x: bump kernel to latest version
	(3.0.35-4.1.0)
In-Reply-To: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <1380136072-9879-4-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 configs/nitrogen6x_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 4c4bd1b..0357e6d 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -20,6 +20,6 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/2dc5560/linux-imx6-2dc5560.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/5809938/linux-imx6-5809938.tar.gz
 BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
1.8.1.2
