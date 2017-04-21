From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Apr 2017 10:07:45 +0100
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.{4,9,10}.x series
Message-ID: <20170421090746.50195-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7a62442..b574e65 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -218,7 +218,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.73"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.62"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.23"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.11"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.63"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.24"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.12"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.10.2
