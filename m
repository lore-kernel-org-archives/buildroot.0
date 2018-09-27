From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 22:10:17 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux-headers: bump 4.{4,
 9, 14, 17}.x series
Message-ID: <20180927201201.F14AF8880E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=062d9034a6bb2d578ae9c2af4ad35f5210e8ca26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

[Peter: drop 4.17.x change]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 182a6c231b95e6f72af453632495151380a560de)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f602bb24d6..db0f73fb9c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -242,12 +242,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.151"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.123"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.152"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.124"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.66"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.67"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
