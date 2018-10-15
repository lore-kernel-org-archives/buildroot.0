From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Oct 2018 19:25:39 +0200
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.{4, 9, 14,
 18}.x series
Message-ID: <20181015172540.29664-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 0a913de1f8..5a00e786af 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 10604f7f8ccab5e7ce71f2e87d1410be679cd11c29c6c608ce35df1db40991de  linux-4.18.10.tar.xz
+sha256 36c6d1360db9eab40270db6d292c259dd34d3dc06049d64afe3e4cfafb8562d3  linux-4.18.14.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
-sha256 df925906250bbc40fcf0137d7ad0fb8edc528d926832634f1233b7540564557f  linux-4.14.72.tar.xz
-sha256 6f5510d3fcfec1bf1e2d9c8e2fdcd7628c1886c6bdb29092adc5ccdf75e39318  linux-4.9.129.tar.xz
-sha256 571c8f6e8cabcc4e8c813869b87527f6e8e427b1c8fef96330c99743700f22a9  linux-4.4.158.tar.xz
+sha256 ee3f19a4ff8a42793c193e361e1d34fcc821a5ca9b58db41befb2b4df0e482be  linux-4.14.76.tar.xz
+sha256 3730fc025ba330a6f4908a6a1e4cb86d821000c84167721680ccf1b37b26563   linux-4.9.133.tar.xz
+sha256 be0383d57c52a7ac6b1ca4d989a16a581f52ec9704ccf4ddf066b1b5b1313f87  linux-4.4.161.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
 sha256 ad96d797571496c969aa71bf5d08e9d2a8c84458090d29a120f1b2981185a99e  linux-3.2.102.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7c9c1d0fb0..cdf639ab3a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -290,11 +290,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.158"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.129"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.72"	if BR2_KERNEL_HEADERS_4_14
+	default "4.4.161"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.133"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.76"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
-	default "4.18.10"	if BR2_KERNEL_HEADERS_4_18
+	default "4.18.14"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.19.1
