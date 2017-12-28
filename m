From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Dec 2017 23:42:37 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
 9}.x series
Message-ID: <20171228224434.3700C837B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=758216aceae0bc7f69ad9b1da4c66d417fbe9289
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1bc6f2d5cde30537b392d92601fe860c20a4d049)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 173ac98..6d6afc6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.47"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.104"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.105"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.67"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.68"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
