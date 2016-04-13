From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Apr 2016 21:06:09 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.12.x series
Message-ID: <20160413190937.5815C80162@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8921e11f7703b8fe80280dda21171d8ab8f74af7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f78e5c7..9f80224 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -213,7 +213,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.79"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.111"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.56"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.57"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.66"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.30"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
