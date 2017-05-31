From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 May 2017 08:02:27 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.1.x series
Message-ID: <20170531060309.2C1207FA85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e0cb0c12dcbb0625b42481d7057b17d7bf4ad3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5a0cd03..c7a3710 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -226,7 +226,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.40"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.70"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.30"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
