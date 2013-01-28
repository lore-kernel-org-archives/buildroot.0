From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Jan 2013 08:14:49 -0300
Subject: [Buildroot] [PATCH 1/2] kernel-headers: bump 3.{0, 4,
	7}.x stable versions
Message-ID: <1359371690-3703-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                                  | 6 +++---
 ...0.61-headers_install-fix-__packed-in-exported-kernel-head.patch} | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename toolchain/kernel-headers/{linux-3.0.60-headers_install-fix-__packed-in-exported-kernel-head.patch => linux-3.0.61-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index a966220..5fda815 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -58,13 +58,13 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.0.60"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.61"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.37"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.27"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.28"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
-	default "3.7.4"		if BR2_KERNEL_HEADERS_3_7
+	default "3.7.5"		if BR2_KERNEL_HEADERS_3_7
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.60-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.61-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.60-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.61-headers_install-fix-__packed-in-exported-kernel-head.patch
-- 
1.7.12.4
