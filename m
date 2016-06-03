From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:44:05 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{18, 14,
	12}.x and 4.{1, 4, 5}.x series
Message-ID: <20160603074409.D7E9481FBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=240cb9663df47403d65c6cafe0b52b7204de7991
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6890c9e..d53766b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -221,15 +221,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.80"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.59"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.70"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.33"	if BR2_KERNEL_HEADERS_3_18
+	default "3.12.60"	if BR2_KERNEL_HEADERS_3_12
+	default "3.14.71"	if BR2_KERNEL_HEADERS_3_14
+	default "3.18.34"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.24"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.25"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.11"	if BR2_KERNEL_HEADERS_4_4
-	default "4.5.5"		if BR2_KERNEL_HEADERS_4_5
+	default "4.4.12"	if BR2_KERNEL_HEADERS_4_4
+	default "4.5.6"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.1"		if BR2_KERNEL_HEADERS_4_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
