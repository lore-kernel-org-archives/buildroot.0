From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 17:34:32 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] linux-headers: bump 4.{4,
	9, 11}.x series
Message-ID: <20170702153426.9957A801DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa62668f40de455f8b6ab3c60d618c7bfba4a54f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 463e68d0581408caa9199a092c9fe8c000d9ed55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e5c0109..3b91c04 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.74"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.34"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.75"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.35"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.7"	if BR2_KERNEL_HEADERS_4_11
+	default "4.11.8"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
