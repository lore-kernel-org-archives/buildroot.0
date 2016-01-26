From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 23:00:27 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{2, 10,
	14}.x and 4.{1, 3}.x series
Message-ID: <20160201224701.923A77F9DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9504ccaf7a9b7932ed476897a2782deb29870bd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ade95be..1c19854 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -202,17 +202,17 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.75"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.76"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.94"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.95"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.52"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.58"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.59"	if BR2_KERNEL_HEADERS_3_14
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.25"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.15"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.16"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
-	default "4.3.3"		if BR2_KERNEL_HEADERS_4_3
+	default "4.3.4"		if BR2_KERNEL_HEADERS_4_3
 	default "4.4"		if BR2_KERNEL_HEADERS_4_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
