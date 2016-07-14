From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jul 2016 12:33:34 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.18.x and 4.{1,
	4}.x series
Message-ID: <20160714103412.3EB7980129@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=166df145b3ead739f4eec359a153eeaad7289426
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 82ce45c..5845f60 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -232,13 +232,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.102"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.61"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.73"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.36"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.37"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.27"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.28"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.14"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.15"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.4"		if BR2_KERNEL_HEADERS_4_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
