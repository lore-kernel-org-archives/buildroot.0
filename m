From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Sep 2015 15:42:35 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{4, 10, 12,
	14}.x and 4.{1, 2}.x series
Message-ID: <20150922134308.6C43E8198B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ea48659c099ce9e7bed8b43eadaec4a4daf8c03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fcd276b..9bb16b9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -192,15 +192,15 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.71"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.108"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.88"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.47"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.52"	if BR2_KERNEL_HEADERS_3_14
+	default "3.4.109"	if BR2_KERNEL_HEADERS_3_4
+	default "3.10.89"	if BR2_KERNEL_HEADERS_3_10
+	default "3.12.48"	if BR2_KERNEL_HEADERS_3_12
+	default "3.14.53"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.21"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.7"		if BR2_KERNEL_HEADERS_4_1
-	default "4.2"		if BR2_KERNEL_HEADERS_4_2
+	default "4.1.8"		if BR2_KERNEL_HEADERS_4_1
+	default "4.2.1"		if BR2_KERNEL_HEADERS_4_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
