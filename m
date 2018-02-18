From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Feb 2018 21:59:25 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 14,
 15}.x series
Message-ID: <20180218210246.E41388523D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa77030b8f5e41f1c53eb1c1ad664b8c814ba032
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3d8920b51a..4762494f69 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -242,12 +242,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.98"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.115"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.81"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.116"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.82"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.19"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.3"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.20"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.4"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
