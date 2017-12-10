From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Dec 2017 20:58:32 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 14}.x series
Message-ID: <20171210195454.5E3DE8110B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a4e86d4d2f9132b58b823a485eafe0ccd70743c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 30122b0..db08963 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -258,5 +258,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.4"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.5"	if BR2_KERNEL_HEADERS_4_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
