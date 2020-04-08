From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  8 Apr 2020 16:39:02 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 5.{4, 5,
 6}.x series
Message-ID: <20200408143903.3865-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a6ec197dc7..d11707b32f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.6.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.6.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 5a03e3b275..5ffd1ee003 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  2d4d91d8329c1ed3826c61463650dd4bfbb6ad39dcee6dba4f98a7e94a67b5b9  linux-5.6.2.tar.xz
-sha256  c41fd8052e3e53de5bf0a0d666f92b7a9ea2d5f09b24423ee8c090f1e77ce214  linux-5.5.15.tar.xz
-sha256  11dd78f701bce619d90d3b2ee597601716c48087e159c890c1decd7b90349def  linux-5.4.30.tar.xz
+sha256  1d13689abbcab59250a8231a5871747be25a1d2fe431cf263395de35780c50aa  linux-5.6.3.tar.xz
+sha256  85fb308a8a204e4913e078d50ac94dad05a6aca9cacfe5d6b6fbfbb903f70708  linux-5.5.16.tar.xz
+sha256  a11083f8f809887f6a0f8d4467532385b99418f17998fe6e837807491c276eeb  linux-5.4.31.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  ea68cb8e9fa255bb1d0402c5aa8f26984f9b1c8607ff3bed5d3284109167f063  linux-4.4.218.tar.xz
 sha256  df3a6e615ec4c57b04775e9c018c67045223ac662e696d28fd37baa5114349cd  linux-4.9.218.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e2d4638b5a..d2b9b5155a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -338,9 +338,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.218"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.175"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.114"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.30"	if BR2_KERNEL_HEADERS_5_4
-	default "5.5.15"	if BR2_KERNEL_HEADERS_5_5
-	default "5.6.2"		if BR2_KERNEL_HEADERS_5_6
+	default "5.4.31"	if BR2_KERNEL_HEADERS_5_4
+	default "5.5.16"	if BR2_KERNEL_HEADERS_5_5
+	default "5.6.3"		if BR2_KERNEL_HEADERS_5_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
