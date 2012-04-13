From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Apr 2012 15:45:45 -0300
Subject: [Buildroot] [PATCH] kernel-headers: bump 3.{0, 2,
	3}.x stable versions
Message-ID: <1334342745-26370-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |    6 +++---
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 ...umode_t.patch => linux-3.3.2-fix-umode_t.patch} |    0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.27-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.28-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)
 rename toolchain/kernel-headers/{linux-3.3.1-fix-umode_t.patch => linux-3.3.2-fix-umode_t.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 2cdd3e3..3430966 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -63,9 +63,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.27"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.28"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.14"	if BR2_KERNEL_HEADERS_3_2
-	default "3.3.1"		if BR2_KERNEL_HEADERS_3_3
+	default "3.2.15"	if BR2_KERNEL_HEADERS_3_2
+	default "3.3.2"		if BR2_KERNEL_HEADERS_3_3
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.27-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.28-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.27-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.28-headers_install-fix-__packed-in-exported-kernel-head.patch
diff --git a/toolchain/kernel-headers/linux-3.3.1-fix-umode_t.patch b/toolchain/kernel-headers/linux-3.3.2-fix-umode_t.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.3.1-fix-umode_t.patch
rename to toolchain/kernel-headers/linux-3.3.2-fix-umode_t.patch
-- 
1.7.3.4
