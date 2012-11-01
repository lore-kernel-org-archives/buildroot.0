From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu,  1 Nov 2012 20:32:22 +0100
Subject: [Buildroot] [PATCH 1/1] bump latest stable kernel headers
Message-ID: <1351798342-4427-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


bump latest stable kernel headers.
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 toolchain/kernel-headers/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 2270e0c..d596870 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -67,12 +67,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.49"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.50"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.32"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.33"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.16"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.17"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
-	default "3.6.4"		if BR2_KERNEL_HEADERS_3_6
+	default "3.6.5"		if BR2_KERNEL_HEADERS_3_6
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.0
