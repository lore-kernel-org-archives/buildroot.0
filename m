From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Jul 2017 17:29:03 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 11,
	12}.x series
Message-ID: <20170715152512.B66C47FE2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a78c0935d90e10d140326b2757471b16ff8462ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6dc519d..2cb2d1e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -235,9 +235,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.76"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.37"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.77"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.38"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.10"	if BR2_KERNEL_HEADERS_4_11
-	default "4.12.1"		if BR2_KERNEL_HEADERS_4_12
+	default "4.11.11"	if BR2_KERNEL_HEADERS_4_11
+	default "4.12.2"		if BR2_KERNEL_HEADERS_4_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
