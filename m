From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 28 Jul 2013 11:18:09 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{2,
	10}.x stable versions
Message-ID: <1375021090-31759-1-git-send-email-gustavo@zacarias.com.ar>
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
index 7a5decd..7a61b55 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -74,7 +74,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.87"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.48"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.49"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
 	default "3.4.54"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
@@ -82,6 +82,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.2"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.3"	if BR2_KERNEL_HEADERS_3_10
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.1.5
