From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 May 2018 23:23:48 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux-headers: bump 4.{4,
 9, 14, 16}.x series
Message-ID: <20180503212818.5A43E8B4BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=314c9050e525e6e1e19663415074ad0fdd972ab1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

[Peter: drop 4.16.x change]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c3cce05ac772e7803c81a8e8cb7fdcc1c21129cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5f45136980..7d579325aa 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -242,12 +242,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.130"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.97"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.131"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.98"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.38"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.39"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
