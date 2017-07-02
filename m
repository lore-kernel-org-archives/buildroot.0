From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 17:08:08 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.1.x
	series
Message-ID: <20170702150543.ABF3181D3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80efa3f1fec11c02d5a631fa46a28307815703cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e79c574a9e17cd742fc4020545de9e33d8fdef38)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 148e1f2..62f40b8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -221,7 +221,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.58"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.41"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.74"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
 	default "4.9.34"	if BR2_KERNEL_HEADERS_4_9
