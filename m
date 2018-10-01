From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 21:01:52 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] linux-headers: bump 4.{4,
 9, 14}.x series
Message-ID: <20181001190338.0B5C18B33B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fde9651825623ea94882154de1a098c2cee90de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 57022f5160311332e234dc03b6f4f7db681d0ef0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 132cf6aecc..ec92e88b84 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -266,13 +266,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.154"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.125"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.155"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.126"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.68"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.69"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.17.19"	if BR2_KERNEL_HEADERS_4_17
