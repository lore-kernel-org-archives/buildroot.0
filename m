From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jun 2016 10:32:22 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.12.x series
Message-ID: <20160622083404.7EA677FD4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3f84c7e2a9cd90a633095adb960729461a15777
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 441be3c..7162e21 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -221,7 +221,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.81"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.102"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.60"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.61"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.72"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.35"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
