From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Jun 2017 12:00:56 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] linux-headers: bump 3.2.x
	series
Message-ID: <20170607100155.C55918164D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=207eba7e5d45675db945df3741c746c162a3b6c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit efda13af190d36086be4eb8f482838e27ecbdd0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c7a3710..b493234 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.88"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.89"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
