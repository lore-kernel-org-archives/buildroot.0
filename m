From: =?UTF-8?q?Beno=C3=AEt=20Mauduit?= <bmauduit@beneth.fr>
Date: Wed, 27 Apr 2016 23:20:59 +0200
Subject: [Buildroot] [PATCH 2/3] raspberrypi2_defconfig: bump to kernel
	version 4.4.8
In-Reply-To: <1461792060-32385-1-git-send-email-bmauduit@beneth.fr>
References: <1461792060-32385-1-git-send-email-bmauduit@beneth.fr>
Message-ID: <1461792060-32385-2-git-send-email-bmauduit@beneth.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Mauduit <bmauduit@beneth.fr>
---
 configs/raspberrypi2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 69a5403..e45a970 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -13,7 +13,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3de232825c9ba5989522b8691eb6ac5df6619458"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="26f3b72a9c049be10e6af196252283e1f6ab9d1f"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
-- 
2.8.1
