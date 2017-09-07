From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Sep 2017 21:05:39 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 12}.x series
Message-ID: <20170907190433.C80E37FC59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19af2fe70cf8764139bcf16e2b364126cfa2456b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e7df0b9..ee3d744 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -236,9 +236,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.86"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.47"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.87"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.48"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
-	default "4.12.10"	if BR2_KERNEL_HEADERS_4_12
+	default "4.12.11"	if BR2_KERNEL_HEADERS_4_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
