From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Dec 2017 23:29:58 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: security
 bump 4.{4, 9, 14}.x series
Message-ID: <20171228224433.F171C837D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b120f564786f845002303026726aaf2bd97fe384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-1000405.

[Peter: drop 4.14.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
[Thomas: adjust commit description to mention the CVE being fixed.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 9f5178fa3495b5b59c4d86c2d1a6fca23bf4e6f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 206e38c..a6676ba 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.46"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.103"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.104"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.66"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.67"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
