From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Jan 2012 14:02:18 -0300
Subject: [Buildroot] [PATCH 1/2] kernel-headers: bump 3.0.x / 3.1.x stable
	versions
Message-ID: <1325696539-30011-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 3.0.15 and 3.1.7

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.14-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.15-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index e092651..2b6e391 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -57,7 +57,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.14"	if BR2_KERNEL_HEADERS_3_0
-	default "3.1.6"		if BR2_KERNEL_HEADERS_3_1
+	default "3.0.15"	if BR2_KERNEL_HEADERS_3_0
+	default "3.1.7"		if BR2_KERNEL_HEADERS_3_1
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.14-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.15-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.14-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.15-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.7.3.4
