From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Oct 2012 22:12:24 -0300
Subject: [Buildroot] [PATCH] kernel-headers: bump 3.0.x stable version
Message-ID: <1351041144-21092-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |    2 +-
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.47-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.48-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index d4be60b..25138ee 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -67,7 +67,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.47"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.48"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.32"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
diff --git a/toolchain/kernel-headers/linux-3.0.47-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.48-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.47-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.48-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.7.8.6
