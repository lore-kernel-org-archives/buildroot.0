From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:09:21 +0200
Subject: [Buildroot] [git commit] linux: bump default to version 4.18.8
Message-ID: <20180916131636.2DC7E88278@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a086fc0b28bffabd53fa02e47274e84796229641
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6a944b6731..ab22d822bb 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.18.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.18.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.138-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
