From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 13:36:03 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 10}.x series
Message-ID: <20170315123843.BB4FE8222F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3d736b9b6b92b70a9020be470a4cf5f7f012b2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 57e67f4..48f9ce5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -218,7 +218,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.71"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.53"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.14"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.2"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.54"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.15"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.3"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
