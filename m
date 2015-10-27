From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 27 Oct 2015 07:20:27 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{10, 14}.x and 4.{1,
	2}.x series
Message-ID: <1445941228-15637-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2ea5717..8135b17 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -193,14 +193,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.72"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.91"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.92"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.49"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.55"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.56"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.22"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.11"	if BR2_KERNEL_HEADERS_4_1
-	default "4.2.4"		if BR2_KERNEL_HEADERS_4_2
+	default "4.1.12"	if BR2_KERNEL_HEADERS_4_1
+	default "4.2.5"		if BR2_KERNEL_HEADERS_4_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.4.10
