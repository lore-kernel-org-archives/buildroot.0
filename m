From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  9 Jun 2012 17:21:03 -0300
Subject: [Buildroot] [PATCH 2/2] kernel-headers: bump 3.{0,
	4}.x stable versions
In-Reply-To: <1339273263-8038-1-git-send-email-gustavo@zacarias.com.ar>
References: <1339273263-8038-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1339273263-8038-2-git-send-email-gustavo@zacarias.com.ar>
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
 rename toolchain/kernel-headers/{linux-3.0.33-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.34-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index ea7c99c..012b436 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -64,10 +64,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.33"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.34"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.19"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.1"		if BR2_KERNEL_HEADERS_3_4
+	default "3.4.2"		if BR2_KERNEL_HEADERS_3_4
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.33-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.34-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.33-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.34-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.7.3.4
