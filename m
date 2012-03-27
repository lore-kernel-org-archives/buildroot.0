From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 27 Mar 2012 19:41:35 -0300
Subject: [Buildroot] [PATCH] kernel-headers: bump 3.0.x and 3.2.x stable
	versions
Message-ID: <1332888095-27917-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.25-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.26-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 8ea037a..0b029ad 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -63,9 +63,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.25"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.26"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.12"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.13"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3"		if BR2_KERNEL_HEADERS_3_3
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.25-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.26-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.25-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.26-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.7.3.4
