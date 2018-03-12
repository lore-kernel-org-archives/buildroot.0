From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Mar 2018 08:53:17 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 14,
 15}.x series
Message-ID: <20180312075335.4F2CF83457@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03b5b444f155ead9c73c2ed2596948de671c5fb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3723e8edec..1560df031b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -242,12 +242,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.99"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.119"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.86"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.121"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.87"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.25"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.8"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.26"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.9"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
