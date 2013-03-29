From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Mar 2013 09:34:02 -0300
Subject: [Buildroot] [PATCH 1/2] kernel-headers: bump 3.{0, 2, 4,
	8}.x stable version
Message-ID: <1364560443-27090-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                                | 8 ++++----
 ...71-headers_install-fix-__packed-in-exported-kernel-head.patch} | 0
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.70-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.71-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 4900aef..fa5e779 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -62,14 +62,14 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.0.70"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.71"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.41"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.42"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.37"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.38"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
-	default "3.8.4"		if BR2_KERNEL_HEADERS_3_8
+	default "3.8.5"		if BR2_KERNEL_HEADERS_3_8
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.70-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.71-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.70-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.71-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.8.1.5
