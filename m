From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 13:34:14 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{15, 16}.x series
Message-ID: <20180412113421.79A418848E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77ebc428d62ae2b40e723b401bc003f26fcbc601
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 40faef2281..5bec53fd98 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -257,6 +257,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
 	default "4.14.33"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.16"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.1"	if BR2_KERNEL_HEADERS_4_16
+	default "4.15.17"	if BR2_KERNEL_HEADERS_4_15
+	default "4.16.2"	if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
