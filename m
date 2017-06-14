From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jun 2017 21:19:05 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] linux-headers: bump 4.{4,
	9, 11}.x series
Message-ID: <20170614191918.4C4657FDC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=814bf474c801737813c8262f32a199623cae4d22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 762e25a29e1325a9a2d406f079bc22e34ce585c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 40ef88f..70a90a9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.40"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.71"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.31"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.72"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.32"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.4"	if BR2_KERNEL_HEADERS_4_11
+	default "4.11.5"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
