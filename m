From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 11:55:27 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux-headers: bump 4.1.x
 series
Message-ID: <20180131123622.4AB8B880C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14fe0b7a8b5e57e38cbf8f18fa80209a515fa6f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4d7bd9f64320d73f41e00de602a368be05b848b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9a4e25453b..873e857243 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -243,7 +243,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.48"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.112"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.77"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
