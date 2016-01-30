From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jan 2016 08:36:07 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{10, 14}.x series
Message-ID: <20160201224713.674637F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a4cc5b19477961d670e5cfa7997c8dedd11681f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 013b1f2..bdc7ef0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -204,9 +204,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.76"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.95"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.96"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.53"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.59"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.60"	if BR2_KERNEL_HEADERS_3_14
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.26"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
