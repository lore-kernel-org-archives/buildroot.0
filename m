From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 13:28:46 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9,
	10}.x and 3.12.x series
Message-ID: <20170315123843.741318222F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d18cdcebc238706d1bf50460b85ea36eaed83b21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 57e690e..57e67f4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -216,9 +216,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.86"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.70"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.71"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.52"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.13"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.1"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.53"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.14"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.2"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
