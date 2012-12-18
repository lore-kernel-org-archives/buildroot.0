From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Dec 2012 08:10:59 -0300
Subject: [Buildroot] [PATCH 1/2] kernel-headers: bump 3.{0, 4, 6,
	7}.x stable versions
Message-ID: <1355829060-27996-1-git-send-email-gustavo@zacarias.com.ar>
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
 rename toolchain/kernel-headers/{linux-3.0.56-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.57-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index daffef7..a8a8a2b 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -58,13 +58,13 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.0.56"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.57"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.35"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.23"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.24"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
-	default "3.6.10"	if BR2_KERNEL_HEADERS_3_6
-	default "3.7"		if BR2_KERNEL_HEADERS_3_7
+	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
+	default "3.7.1"		if BR2_KERNEL_HEADERS_3_7
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.56-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.57-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.56-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.57-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.7.8.6
