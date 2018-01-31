From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 12:57:56 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.1.x
 series
Message-ID: <20180131123645.A18CC88170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e8ffd8180a3a947dd43f3606832e183a90e6860
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4d7bd9f64320d73f41e00de602a368be05b848b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f6cda9a061..08beeb05bf 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -221,7 +221,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.72"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.48"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.112"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
 	default "4.9.77"	if BR2_KERNEL_HEADERS_4_9
