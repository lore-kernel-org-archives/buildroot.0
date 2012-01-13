From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 12 Jan 2012 22:11:51 -0300
Subject: [Buildroot] [PATCH 1/2] kernel-headers: bump 3.0.x,
	3.1.x and 3.2.x series
Message-ID: <1326417112-8213-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump 3.0.x series to 3.0.17, 3.1.x series to 3.1.9 and 3.2.x series to
3.2.1

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |    6 +++---
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.15-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.17-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index e6b2909..cf2ac4e 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -60,8 +60,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.15"	if BR2_KERNEL_HEADERS_3_0
-	default "3.1.8"		if BR2_KERNEL_HEADERS_3_1
-	default "3.2"		if BR2_KERNEL_HEADERS_3_2
+	default "3.0.17"	if BR2_KERNEL_HEADERS_3_0
+	default "3.1.9"		if BR2_KERNEL_HEADERS_3_1
+	default "3.2.1"		if BR2_KERNEL_HEADERS_3_2
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.15-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.17-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.15-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.17-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.7.3.4
