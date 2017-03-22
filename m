From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 23:09:28 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{2, 12}.x and 4.{1, 4,
	9, 10}.x series
Message-ID: <20170322221051.8A37182245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d70d1dbf054f4a0609ba1076bc7e097305013d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c506aab..4f17f26 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -213,12 +213,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.86"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.87"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.71"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.55"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.16"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.4"	if BR2_KERNEL_HEADERS_4_10
+	default "3.12.72"	if BR2_KERNEL_HEADERS_3_12
+	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.56"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.17"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.5"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
