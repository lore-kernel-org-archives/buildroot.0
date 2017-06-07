From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Jun 2017 21:47:15 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 11}.x series
Message-ID: <20170607194809.B26BF7F96A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13a6a126fcfbfe63690955f0fb0c3118358049cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b493234..40ef88f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.40"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.70"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.30"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.71"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.31"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.3"	if BR2_KERNEL_HEADERS_4_11
+	default "4.11.4"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
