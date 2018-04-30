From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 22:17:13 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux-headers: bump 4.{15,
 16}.x series
Message-ID: <20180501073414.CDADD8147F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=555621a0bef086564ea9339df96271abbff5220e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

[Peter: drop 4.16.x change]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 77ebc428d62ae2b40e723b401bc003f26fcbc601)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3bd3e779b0..bbdd535e26 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -249,5 +249,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
 	default "4.14.33"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.16"	if BR2_KERNEL_HEADERS_4_15
+	default "4.15.17"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
