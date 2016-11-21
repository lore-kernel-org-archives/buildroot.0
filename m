From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 21 Nov 2016 10:49:27 +0000
Subject: [Buildroot] [PATCH v3 1/2] linux-headers: bump 3.2.x and 4.{4,
	8}.x series
Message-ID: <20161121104928.44869-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
 - also bump 3.2.x series
 - bump 4.8.x series to 4.8.10 instead of 4.8.8
Changes v1 -> v2:
 - rebase on top of master
 - drop 3.12.x changes as they are already part of master
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8bfad44..5c42d53 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -223,7 +223,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.83"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.84"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.104"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.67"	if BR2_KERNEL_HEADERS_3_12
@@ -232,9 +232,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.35"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.31"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.34"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7.10"	if BR2_KERNEL_HEADERS_4_7
-	default "4.8.7"		if BR2_KERNEL_HEADERS_4_8
+	default "4.8.10"	if BR2_KERNEL_HEADERS_4_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.10.1
