From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 23:14:57 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{0, 1}.x series
Message-ID: <20190623211402.4E3C583D76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a103c8e524ae7970e52a652718611cf3b6aeedc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2676d4fb2ab72f8756d23a8f2661ba57cf8ebbd0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6f93c2122c..f1695f8f94 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.47" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.51" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 1f580c86cd..1b75082114 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 5d08f3890e7ca2b94529675120f170c5b764f795e6dd184a1190c23a40ef5365  linux-4.19.47.tar.xz
-sha256 25f58cb56bde388ac9bcee984f5f2d0ca094b0a8af6b92ad1f5b2fd0e6725b85  linux-4.14.123.tar.xz
-sha256 d25a490d62a3e96a587333e163862585eac4086fc8d4893b4ec1711e7d387c5f  linux-4.9.180.tar.xz
-sha256 1a450217d381bb7fd259d026d3b7a57c717e8d1f66754cd6fcc9df3c4a8a6a7a  linux-4.4.180.tar.xz
+sha256 7afa920d776f8ca3fc3ced5026cc02c5ccc960c58314050982c307589b5a8d70  linux-4.19.51.tar.xz
+sha256 6a2e89504d8560b132ab743a0206ffce026bff2697b705819421c5f125633970  linux-4.14.126.tar.xz
+sha256 8fcd223e11cba322801bc38cdb8b581d64c0115f585dcb6604de8561b574fced  linux-4.9.181.tar.xz
+sha256 b2ab69813192d49b1b7f89257a3319ef3fd73a54f441f3296d68b744b1c681d3  linux-4.4.181.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d092da2fbd..bc53613003 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.180"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.180"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.123"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.47"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.181"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.181"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.126"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.51"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
