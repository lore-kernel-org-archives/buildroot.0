From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 15 Sep 2013 11:52:19 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{0, 4, 10,
	11}.x stable versions
Message-ID: <1379256740-18574-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ers-headers_install-fix-__packed-in-exported-kernel-head.patch | 0
 package/linux-headers/Config.in.host                              | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename package/linux-headers/{3.0.95 => 3.0.96}/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch (100%)

diff --git a/package/linux-headers/3.0.95/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch b/package/linux-headers/3.0.96/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from package/linux-headers/3.0.95/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to package/linux-headers/3.0.96/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3dc0b9d..bc8f821 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -76,17 +76,17 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.0.95"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.96"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.51"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.61"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.62"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.11"	if BR2_KERNEL_HEADERS_3_10
-	default "3.11"		if BR2_KERNEL_HEADERS_3_11
+	default "3.10.12"	if BR2_KERNEL_HEADERS_3_10
+	default "3.11.1"	if BR2_KERNEL_HEADERS_3_11
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.1.5
