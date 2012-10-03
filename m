From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  3 Oct 2012 07:24:56 -0300
Subject: [Buildroot] [PATCH] kernel-headers: bump 3.{0, 4,
	5}.x stable versions
Message-ID: <1349259896-2294-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |    6 +++---
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.43-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.44-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 7e6cc43..bfec5f1 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -67,12 +67,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.43"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.44"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.30"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.11"	if BR2_KERNEL_HEADERS_3_4
-	default "3.5.4"		if BR2_KERNEL_HEADERS_3_5
+	default "3.4.12"	if BR2_KERNEL_HEADERS_3_4
+	default "3.5.5"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6"		if BR2_KERNEL_HEADERS_3_6
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.43-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.44-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.43-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.44-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.7.8.6
