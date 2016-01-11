From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2016 17:33:49 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.12.x series
Message-ID: <20160111163526.BB7EB826C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7bb93e0d7d124049234f659d23303fcc8177b52c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6abf731..41e3a92 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -211,7 +211,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.75"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.94"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.51"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.52"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.58"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
