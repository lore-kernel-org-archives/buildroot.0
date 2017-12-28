From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Dec 2017 23:33:35 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.1.x
 series
Message-ID: <20171228224434.0EDBF837AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f17c300ce96ab2aedbee5ec4a89fb91e99a3ffe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ddfd34382804dcbe6f862e44ac8d20edcf951566)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a6676ba..173ac98 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -221,7 +221,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.72"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.46"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.47"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.104"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
 	default "4.9.67"	if BR2_KERNEL_HEADERS_4_9
