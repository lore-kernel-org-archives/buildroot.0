From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 19:02:52 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{17, 16, 14, 12,
	10}.x series
Message-ID: <20141030180343.CC256B2215@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4133e5eee53b739a5892faa8316e79f5065f534e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b494885..b363cdc 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -171,12 +171,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.63"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.104"	if BR2_KERNEL_HEADERS_3_4
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.58"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.59"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.30"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.31"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.22"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.23"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
-	default "3.16.6"	if BR2_KERNEL_HEADERS_3_16
-	default "3.17.1"	if BR2_KERNEL_HEADERS_3_17
+	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
+	default "3.17.2"	if BR2_KERNEL_HEADERS_3_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
