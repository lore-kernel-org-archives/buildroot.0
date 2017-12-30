From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Dec 2017 23:57:22 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux-headers: bump 4.{9,
 14}.x series
Message-ID: <20171230225741.6F65282BD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b885e92902d6daea5d10dae9f46513e85ba3670e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

[Peter: drop 4.14.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e4bdd2a8241eb0c3b6e2634c2b693a743e99cec8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c63495f..4d9652b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -245,7 +245,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.48"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.108"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.72"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.73"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
