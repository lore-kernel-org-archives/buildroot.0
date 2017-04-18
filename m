From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Apr 2017 17:44:07 +0200
Subject: [Buildroot] [git commit] package/linux-headers: bump 3.12.x and
	4.{4, 9, 10}.x series
Message-ID: <20170418154529.E4C89816A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a96a8435d572a76b7529435a243654ab48bc6370
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 27b5a7e..7a62442 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -216,9 +216,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.88"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.72"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.73"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.61"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.22"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.10"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.62"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.23"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.11"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
