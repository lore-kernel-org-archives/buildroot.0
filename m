From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:07:00 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{4, 12, 18}.x series
Message-ID: <20160427200709.DF44581E39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e40766473e8ebf5ad342ebc94f018c0e22d4fb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7acbf61..2e01e3d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -211,11 +211,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.79"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.111"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.57"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.59"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.67"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.31"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.32"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.22"	if BR2_KERNEL_HEADERS_4_1
