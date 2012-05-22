From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 May 2012 11:56:29 -0300
Subject: [Buildroot] [PATCH 1/3] kernel-headers: bump 3.{0,
	3}.x stable versions
Message-ID: <1337698591-22898-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 ...umode_t.patch => linux-3.3.7-fix-umode_t.patch} |    0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.31-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.32-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)
 rename toolchain/kernel-headers/{linux-3.3.6-fix-umode_t.patch => linux-3.3.7-fix-umode_t.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index cd83270..1253531 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -63,9 +63,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.31"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.32"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.18"	if BR2_KERNEL_HEADERS_3_2
-	default "3.3.6"		if BR2_KERNEL_HEADERS_3_3
+	default "3.3.7"		if BR2_KERNEL_HEADERS_3_3
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.31-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.32-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.31-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.32-headers_install-fix-__packed-in-exported-kernel-head.patch
diff --git a/toolchain/kernel-headers/linux-3.3.6-fix-umode_t.patch b/toolchain/kernel-headers/linux-3.3.7-fix-umode_t.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.3.6-fix-umode_t.patch
rename to toolchain/kernel-headers/linux-3.3.7-fix-umode_t.patch
-- 
1.7.3.4
