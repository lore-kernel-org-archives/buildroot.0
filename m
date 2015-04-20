From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 22:31:33 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{10, 14, 19}.x series
Message-ID: <20150420203148.9DA4481D53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e96e272103905b110d77f5c435e67746d14f03fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 49f818b..e0a676d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -200,15 +200,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.68"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.107"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.74"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.75"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.40"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.38"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.39"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.11"	if BR2_KERNEL_HEADERS_3_18
-	default "3.19.4"	if BR2_KERNEL_HEADERS_3_19
+	default "3.19.5"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0"		if BR2_KERNEL_HEADERS_4_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
