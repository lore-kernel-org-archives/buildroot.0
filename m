From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:41:46 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.1.x
	series
Message-ID: <20170601144624.7B9A28296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e73a40c41c79c44e7bf29b021d4feb6905bbd991
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8e0cb0c12dcbb0625b42481d7057b17d7bf4ad3d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a94d83d..89f7a84 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -221,7 +221,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.53"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.40"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.70"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
 	default "4.9.30"	if BR2_KERNEL_HEADERS_4_9
