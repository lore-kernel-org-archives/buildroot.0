From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 23:29:28 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 18}.x series
Message-ID: <20181125222832.0A17F88438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79cad27b7977e906b4e70847df14e23420e1ea79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: drop 4.18.x, linux / hash changes]
(cherry picked from commit cd0ca09e43be8bd87fa35c96fa099a338b85de36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2cee8e09b6..c3c43ce83a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -266,13 +266,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.161"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.133"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.163"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.136"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.76"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.80"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.17.19"	if BR2_KERNEL_HEADERS_4_17
