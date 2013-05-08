From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 May 2013 07:40:00 -0300
Subject: [Buildroot] [PATCH 1/2] kernel-headers: bump 3.{0, 4, 8,
	9}.x stable version
Message-ID: <1368009601-17636-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                                | 8 ++++----
 ...77-headers_install-fix-__packed-in-exported-kernel-head.patch} | 0
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.76-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.77-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index a6135e3..fd52e82 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -70,15 +70,15 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.0.76"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.77"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.44"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.43"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.44"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
-	default "3.8.11"	if BR2_KERNEL_HEADERS_3_8
-	default "3.9"		if BR2_KERNEL_HEADERS_3_9
+	default "3.8.12"	if BR2_KERNEL_HEADERS_3_8
+	default "3.9.1"		if BR2_KERNEL_HEADERS_3_9
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.76-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.77-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.76-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.77-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.8.1.5
