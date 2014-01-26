From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jan 2014 20:57:10 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{10,
	12}.x stable versions
Message-ID: <20140126202758.F22ED9C630@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18ed49e4d536dab482847592512113abd76a30e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0e4143c..618c928 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -92,9 +92,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.27"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.28"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.8"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.9"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13"		if BR2_KERNEL_HEADERS_3_13
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
