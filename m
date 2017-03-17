From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Mar 2017 00:18:38 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
	9, 10}.x series
Message-ID: <20170317234445.2FF527FE0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a1ec309d748d1d1cdb4f3b9dbcd7eb08c7b0e93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: skip 4.10.x]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b3d736b9b6b92b70a9020be470a4cf5f7f012b2e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 72fbcc6..a848be6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.53"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.54"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.14"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.15"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
