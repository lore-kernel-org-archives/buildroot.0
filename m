From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Feb 2013 10:39:21 -0300
Subject: [Buildroot] [PATCH] kernel-headers: bump 3.2.x stable version
Message-ID: <1360157961-18552-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 432ef20..710dd13 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -60,7 +60,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.62"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.37"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.38"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
 	default "3.4.29"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
-- 
1.7.12.4
