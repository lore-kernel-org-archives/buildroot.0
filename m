From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 23:08:33 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux-headers: bump 4.4.x
 series
Message-ID: <20180611211537.6DBA68832D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efc613d6b139d7ab7a8662c7cb42838ccc69ebeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9ee9adc747762347fe9e17d544bc5bc7b032e24c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bee86d1388..65e0556f88 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -242,7 +242,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.131"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.133"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.103"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
