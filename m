From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 19 Oct 2013 13:35:07 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{10,
	11}.x stable versions
Message-ID: <1382200508-20743-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1768868..124a68f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -86,7 +86,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.16"	if BR2_KERNEL_HEADERS_3_10
-	default "3.11.5"	if BR2_KERNEL_HEADERS_3_11
+	default "3.10.17"	if BR2_KERNEL_HEADERS_3_10
+	default "3.11.6"	if BR2_KERNEL_HEADERS_3_11
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.1.5
