From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Sep 2018 09:44:58 -0300
Subject: [Buildroot] [PATCH 1/2] linux: bump default to version 4.18.10
Message-ID: <1537965899-8253-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 linux/Config.in  | 2 +-
 linux/linux.hash | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3a270c5..235018c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.18.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.18.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.138-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 589e5f8..9e37af4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 4c995351e57902a04a94e43796407b4ba295c8eae070c27e99f8f99c321e917a  linux-4.18.9.tar.xz
+sha256 10604f7f8ccab5e7ce71f2e87d1410be679cd11c29c6c608ce35df1db40991de  linux-4.18.10.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
 sha256 76a4473dbcbd922c23a16130414829a36eb7e2f4e5859bd1b742fffdff907489  linux-4.14.71.tar.xz
 sha256 bdb76f48491a6aadc89c0f0f7fdc240d77cee54da5aac59da0b5d98e226b6f12  linux-4.9.128.tar.xz
-- 
2.7.4
