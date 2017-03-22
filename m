From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 22 Mar 2017 13:19:27 +0000
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{2, 12}.x and 4.{1, 4,
	9, 10}.x series
Message-ID: <20170322131928.5150-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/linux-headers/Config.in.host | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c506aab..4f17f26 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -213,12 +213,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.86"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.87"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.71"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.55"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.16"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.4"	if BR2_KERNEL_HEADERS_4_10
+	default "3.12.72"	if BR2_KERNEL_HEADERS_3_12
+	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.56"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.17"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.5"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.10.2
