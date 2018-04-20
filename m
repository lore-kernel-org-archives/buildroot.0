From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 16:36:02 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{14, 15, 16}.x series
Message-ID: <20180420143629.DABF583F35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea4921d875a45fe03b86b672a432ff2e88268733
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4b4c8ddf9e..9d32687c0e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -256,7 +256,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.33"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.17"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.2"	if BR2_KERNEL_HEADERS_4_16
+	default "4.14.35"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
+	default "4.16.3"	if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
