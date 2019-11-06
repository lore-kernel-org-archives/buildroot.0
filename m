From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  6 Nov 2019 16:49:53 +0100
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.3.x series
Message-ID: <20191106154953.15167-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d26bf1b14a..3794ff00cf 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.3.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.3.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 4790bd4427..c29f7c23e8 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 78f3cfc6c20b10ff21c0bb22d7d257cab03781c44d8c5aae289f749f94f76649  linux-5.3.8.tar.xz
+sha256 d72579aa732edd0e25779adfc43e68a53f77e80020c4aab5db2f5b28c247e98a  linux-5.3.9.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 293ec1ae0f6b3b4be83a217224b51d137f2163cf2d9d294eecf5d0a354e4e29d  linux-4.19.81.tar.xz
-sha256 ff519c428ee9bbb513a84db5ec32a7e3705cd8c23a57104b25b944cb79583fae  linux-4.14.151.tar.xz
-sha256 9572ebfa6ba0efcf9f1ec7b62c7b89baa36a621ab9fd4c5ad025196c549605ac  linux-4.9.198.tar.xz
-sha256 ecf808d88d04086da25bf44288d63a7110dd99948c17bc1162e5301abccff312  linux-4.4.198.tar.xz
+sha256 58d96d6c2c5ee8288fe9714891e4037a18f457b008e369e33fc744afc2cb595d  linux-4.19.82.tar.xz
+sha256 a9239fd9d341aae07b48a8e7a2afd528fe5cde2617d783454c71e6f3dae2b0aa  linux-4.14.152.tar.xz
+sha256 0f2531f0908e320ee49954e8d84406db659073b202abc514bcc999ceaa3f7ed5  linux-4.9.199.tar.xz
+sha256 1739b0991407c94b328ceab27d77f25a1a3ae03367e8b800e5964a99789165f0  linux-4.4.199.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b26dbe8975..3680d6771f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,11 +305,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.198"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.198"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.151"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.81"	if BR2_KERNEL_HEADERS_4_19
-	default "5.3.8"		if BR2_KERNEL_HEADERS_5_3
+	default "4.4.199"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.199"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.152"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.82"	if BR2_KERNEL_HEADERS_4_19
+	default "5.3.9"		if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
