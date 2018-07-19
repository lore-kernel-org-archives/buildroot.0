From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jul 2018 00:11:16 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] linux-headers: bump 4.{4,
 17}.x series
Message-ID: <20180719220635.61E028911E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cbf7d459b757dadd2f579d3fb48e5410a49604f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

[Peter: drop 4.17.x change]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 612db70febc2c2c0b175c803d6160ffdf7cd2e90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 28c40fbd4a..ee95b544ff 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -250,7 +250,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.141"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.142"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.113"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
