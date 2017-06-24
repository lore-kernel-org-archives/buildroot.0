From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 21:46:16 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.10.x and 4.{9,
	11}.x series
Message-ID: <20170624194528.9552F7FE9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ad8f6643d9cc0a5d39656e119237e31adaf2c69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6704305..a29cd30 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -224,11 +224,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.89"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.41"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.73"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.33"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.34"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.6"	if BR2_KERNEL_HEADERS_4_11
+	default "4.11.7"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
