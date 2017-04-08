From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:10:36 +0200
Subject: [Buildroot] [git commit] package/linux-headers: bump 3.2.x and 4.{4,
	9, 10}.x series
Message-ID: <20170408131043.576178222C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1953d0ee2eb2ebb9c00288322e20f69aedb9d63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 32dadcd..f64d8d7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -213,12 +213,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.87"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.88"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.72"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.59"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.20"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.8"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.60"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.21"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.9"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
