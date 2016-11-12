From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Nov 2016 19:21:59 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.12.x and 4.{4,
	8}.x series
Message-ID: <20161112182215.8C07E818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52f9243be5ce8e5dfd0b3a1ebe490ea5ac075dad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 71d3f60..8bfad44 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -226,15 +226,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.83"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.104"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.66"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.67"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.79"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.44"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.35"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.29"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.31"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7.10"	if BR2_KERNEL_HEADERS_4_7
-	default "4.8.6"		if BR2_KERNEL_HEADERS_4_8
+	default "4.8.7"		if BR2_KERNEL_HEADERS_4_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
