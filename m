From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jan 2018 15:32:14 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.1.x series
Message-ID: <20180123143331.24E0282B9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d7bd9f64320d73f41e00de602a368be05b848b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 46a6045..55b8df3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -251,7 +251,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.48"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.112"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.77"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
