From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:15:29 +0200
Subject: [Buildroot] [git commit] package/linux-headers: bump 3.12.x and
	4.{4, 9, 10}.x series
Message-ID: <20170511191533.C8B8C8271E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d48436c2bf7ca5a6e3d38ce5c2f3ba0ddd6d7386
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dcfcce9..f851271 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -225,10 +225,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.88"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.73"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.66"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.26"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.14"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.67"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.27"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.15"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11"		if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
