From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 23:37:26 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux-headers: bump 4.{4,
 9, 14, 18}.x series
Message-ID: <20181001213711.D19AC8B55D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1f9d107a399c35a876efb5cd7f7d3a5d64bc420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

[Peter: drop 4.18.x change]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ebe0636db8119870f2cb6a48186bb14c5f20db0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2b09e83b8c..9c13f6b160 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -250,12 +250,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.155"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.126"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.156"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.127"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.69"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.70"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
