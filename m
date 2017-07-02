From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 17:07:32 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] linux-headers: bump 4.1.x
	series
Message-ID: <20170702150613.1510881EDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18d4fd1f2fff09bc21f1e0c12ab941cc1ea4e120
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e79c574a9e17cd742fc4020545de9e33d8fdef38)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 613a26e..e5c0109 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -226,7 +226,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.41"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.74"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.34"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
