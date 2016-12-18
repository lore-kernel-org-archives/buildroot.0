From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 14:23:05 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.12.x series
Message-ID: <20161218132312.8BB8B81776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=613f650d3411bb6ab34db62496c06999ce21cc48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c7a6a61..a95b41d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -234,7 +234,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.84"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.104"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.68"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.69"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.79"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.45"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
