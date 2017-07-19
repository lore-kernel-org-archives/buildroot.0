From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 00:02:01 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
	9, 11}.x series
Message-ID: <20170720055506.E7E2482147@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=711a1eb61a7f71b28e0af15acaadf344cf119b2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: Drop 4.11.x bump]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 00b8764f77c78885f234f980e4b6c49de315349a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 97e8067..db4e18f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.75"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.76"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.33"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.36"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
