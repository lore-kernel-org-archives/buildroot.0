From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 21:50:20 +0200
Subject: [Buildroot] [PATCH 06/23] linux: remove Blackfin related code
In-Reply-To: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180405195037.32641-7-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index d9c5b62863..563db423b1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -194,7 +194,7 @@ choice
 
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
-	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
+	depends on BR2_arc || BR2_arm || BR2_armeb || \
 		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
 		   BR2_sh || BR2_mips || BR2_mipsel || \
 		   BR2_mips64 || BR2_mips64el || BR2_xtensa
-- 
2.14.3
