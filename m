From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 15:43:00 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 14,
 15}.x series
Message-ID: <20180325134504.8433483A80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9534c816383ac45e75ae042b7c668406d9e8b1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3a8adfd6bf..f4c1427f29 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -242,12 +242,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.50"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.123"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.89"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.124"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.90"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.29"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.12"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.30"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.13"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
