From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 15 May 2017 12:36:11 +0100
Subject: [Buildroot] [PATCH master 1/2] linux-headers: bump 4.{4, 9, 10,
	11}.x series
Message-ID: <20170515113612.45653-1-Vincent.Riera@imgtec.com>
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
index f851271cc..014ae70b5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.67"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.27"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.15"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11"		if BR2_KERNEL_HEADERS_4_11
+	default "4.4.68"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.28"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.16"	if BR2_KERNEL_HEADERS_4_10
+	default "4.11.1"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.13.0
