From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 07:33:23 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
	9, 11, 12}.x series
Message-ID: <20170720055510.1C8137F999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30bf45b8da9be325c826552c25dfd2c0a6517389
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: Drop 4.11.x/4.12.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a78c0935d90e10d140326b2757471b16ff8462ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index eea8909..2b82eb5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.76"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.77"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.37"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.38"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
