From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 10:37:05 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.12.x series
Message-ID: <20160309093722.C793B819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=366e9b229f0a99af3d973d9abbea0ac53b59921c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4ca09b2..74ba8bd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -211,7 +211,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.78"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.99"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.55"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.56"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.63"	if BR2_KERNEL_HEADERS_3_14
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.28"	if BR2_KERNEL_HEADERS_3_18
