From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 20:36:42 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.2.x series
Message-ID: <20180227193746.7ABD38132E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8e9bb3267930fd053add7b9eef85749362a1d0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bc1e98a994..6de3660b38 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -240,7 +240,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.98"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.99"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.118"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.84"	if BR2_KERNEL_HEADERS_4_9
