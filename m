From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:48:46 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] linux-headers: bump 4.{14,
 16}.x series
Message-ID: <20180719214653.E8956890F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab68783ce4aa36d472ca4e44f038a46f4ae900c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8974ebaab005a40cf1564650d54d80830e730f55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fdec35efbd..8dd9f944b7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -256,7 +256,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.50"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.51"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.16"	if BR2_KERNEL_HEADERS_4_16
+	default "4.16.17"	if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
