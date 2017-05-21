From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 May 2017 23:32:02 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 10,
	11}.x series
Message-ID: <20170521213905.1E32D8267B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=daf1c350251ac1872ee3849a6b79476d1d026c2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 014ae70..0c53416 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.68"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.28"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.16"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.1"	if BR2_KERNEL_HEADERS_4_11
+	default "4.4.69"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.29"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
+	default "4.11.2"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
