From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 23:55:03 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] linux-headers: bump 3.2.x
 series
Message-ID: <20171127225002.109B17FDFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98ffc851e2aac09a14195e75002134ee796fe252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit c8f0a823efdb3f195c475194dc7b3341502819c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3a63be2..85ec261 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -231,7 +231,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.95"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.96"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
