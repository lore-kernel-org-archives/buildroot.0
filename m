From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Oct 2017 23:56:59 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] linux-headers: bump 4.{1,
	4, 9, 13}.x series
Message-ID: <20171022224414.745B981024@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0121dbb170389a16b91847bacea658820b22d4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

[Peter: drop 4.13.x bump]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 60e3da602d3d5b017b5176848abcba92866df3f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7001bd2..32d4505 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -235,9 +235,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.92"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.56"	if BR2_KERNEL_HEADERS_4_9
+	default "4.1.45"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.93"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.57"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
