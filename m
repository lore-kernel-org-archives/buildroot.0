From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Oct 2019 17:59:08 +0100
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.3.x series
Message-ID: <20191029165908.3622-1-bernd.kuhls@t-online.de>
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
index 35c2829e42..d26bf1b14a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.3.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.3.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 5c57b5ad32..4790bd4427 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 c6c9714e21531c825c306b107bc6f6c7bfa2d5270a14bad170f8de5a73d34802  linux-5.3.7.tar.xz
+sha256 78f3cfc6c20b10ff21c0bb22d7d257cab03781c44d8c5aae289f749f94f76649  linux-5.3.8.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 80a9ba764e088aa7fddfef5a97c0236905e291468a37832243b6f3828d36e7ec  linux-4.19.80.tar.xz
-sha256 65c5a4b86b858ba58642f46ae8c983990376d1946e59cc7e054e85b1b7eb57b0  linux-4.14.150.tar.xz
-sha256 553568b6728d505da70efa8247a66ad158e849c8f5f40d715612ef4e9ed14a0c  linux-4.9.197.tar.xz
-sha256 9cf484511e51861486d2eafc7373f9e47f9c1f50a82e30614073b51570a0ee7a  linux-4.4.197.tar.xz
+sha256 293ec1ae0f6b3b4be83a217224b51d137f2163cf2d9d294eecf5d0a354e4e29d  linux-4.19.81.tar.xz
+sha256 ff519c428ee9bbb513a84db5ec32a7e3705cd8c23a57104b25b944cb79583fae  linux-4.14.151.tar.xz
+sha256 9572ebfa6ba0efcf9f1ec7b62c7b89baa36a621ab9fd4c5ad025196c549605ac  linux-4.9.198.tar.xz
+sha256 ecf808d88d04086da25bf44288d63a7110dd99948c17bc1162e5301abccff312  linux-4.4.198.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9992ab5b5a..b26dbe8975 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,11 +305,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.197"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.197"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.150"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.80"	if BR2_KERNEL_HEADERS_4_19
-	default "5.3.7"		if BR2_KERNEL_HEADERS_5_3
+	default "4.4.198"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.198"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.151"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.81"	if BR2_KERNEL_HEADERS_4_19
+	default "5.3.8"		if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
