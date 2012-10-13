From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Oct 2012 22:26:00 -0300
Subject: [Buildroot] [PATCH] kernel-headers: bump 3.{0, 4, 5,
	6}.x stable versions
Message-ID: <1350091560-2409-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |    8 ++++----
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.45-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.46-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index f111c11..00fb2f5 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -67,12 +67,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.45"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.46"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.31"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.13"	if BR2_KERNEL_HEADERS_3_4
-	default "3.5.6"		if BR2_KERNEL_HEADERS_3_5
-	default "3.6.1"		if BR2_KERNEL_HEADERS_3_6
+	default "3.4.14"	if BR2_KERNEL_HEADERS_3_4
+	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
+	default "3.6.2"		if BR2_KERNEL_HEADERS_3_6
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.45-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.46-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.45-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.46-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.7.8.6
