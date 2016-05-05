From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:19:12 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.14.x and 4.{4,
	5}.x series
Message-ID: <20160505201945.9A10881794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0c40deb7938241c81a85e971b8c3ca8977e5050
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 46f34e6..04d5890 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -214,13 +214,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.59"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.67"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.68"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.32"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.23"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.8"		if BR2_KERNEL_HEADERS_4_4
-	default "4.5.2"		if BR2_KERNEL_HEADERS_4_5
+	default "4.4.9"		if BR2_KERNEL_HEADERS_4_4
+	default "4.5.3"		if BR2_KERNEL_HEADERS_4_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
