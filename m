From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 May 2017 22:41:46 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.4.x series to 4.4.65
Message-ID: <20170501204228.06EF68283C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d18d1d9c0dd8173eee918b30761548c19b6bfdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b1ef3d6..f75fac8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,7 +227,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.73"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.64"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.65"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.25"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.13"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11"		if BR2_KERNEL_HEADERS_4_11
