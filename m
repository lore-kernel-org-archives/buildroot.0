From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 13:38:31 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] linux-headers: bump 4.{4,
 9, 14, 18}.x series
Message-ID: <20181005113744.AB83C8D218@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17eff6f3cbc3bbde568df9602de3060031ad6113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

[Peter: drop 4.18.x change]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit aad44932660d6edf80016ea183e7d5b6e35dc1c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1b83c48563..e1b80eefc9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -266,13 +266,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.156"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.127"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.157"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.128"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.70"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.71"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.17.19"	if BR2_KERNEL_HEADERS_4_17
