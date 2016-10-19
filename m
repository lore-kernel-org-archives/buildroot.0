From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 17:37:58 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.12.x series
Message-ID: <20161019153835.A88468198C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a899cb8b8c8e1942708150f260472df3691ad75c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 759959f..ec8c389 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -226,7 +226,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.82"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.103"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.64"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.65"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.79"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.43"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
