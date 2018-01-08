From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  7 Jan 2018 23:15:08 -0200
Subject: [Buildroot] [PATCH v2] linux-headers: bump 3.2.x series
Message-ID: <1515374108-29630-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Fix Subject line

 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7cac2b3..44751c8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -247,7 +247,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.97"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.98"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-- 
2.7.4
