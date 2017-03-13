From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 13 Mar 2017 11:41:44 +0000
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.{4, 9,
	10}.x and 3.12.x series
Message-ID: <20170313114145.33407-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 57e690e..57e67f4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -216,9 +216,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.86"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.70"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.71"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.52"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.13"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.1"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.53"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.14"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.2"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.10.2
