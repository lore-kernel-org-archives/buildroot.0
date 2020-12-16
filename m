From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Dec 2020 12:22:51 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 9}.x series
Message-ID: <20201216110920.E25078004A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0675498b5d6dfce208cb1bbeb38f3a83611e62c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 9ebf880671..83bc3b851d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43  linux-5.10.tar.xz
-sha256  5eb20a65a410669928f94b3975872e493fa6d0fe441c6a78b7564affa2a5d260  linux-5.9.11.tar.xz
-sha256  49da425c1f3c530fd3ff31d85a0461f6b6dc6e459f7faf3eee23e49a98ce64c7  linux-5.4.80.tar.xz
+sha256  39fcfb41dcdf71b6b42b88eff3d8cedbe7523830ccae847f3914c0b97e1e6b49  linux-5.9.14.tar.xz
+sha256  beec970bbb93de8ab839f27930f7ab00c7bd65af0ffa07a50e765affdc2561c6  linux-5.4.83.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  9e0bdebf18a12d0c899e5e4042e715e24a70ab0fd986a3f4c67c8ec2710bad97  linux-4.4.246.tar.xz
-sha256  49e266c7d72d388e8ce6aa486a1018cc0595ae1b9e99934bce5b484fd8dba9f5  linux-4.9.246.tar.xz
-sha256  cb02465cc8f1972cc14707b25d779c8668d220c39e68a24bb23afd4c58182b9c  linux-4.14.209.tar.xz
-sha256  18345206f9c61e8adafa5204d0ca0b8619f1d9aafd70cbd5cb0fbf1faf521585  linux-4.19.160.tar.xz
+sha256  e52a49ceb639d871478a143c314648c35e22222c317ecdf49866830fea5c3dfc  linux-4.4.248.tar.xz
+sha256  4687268061c9933c298b30d28e4bf1a30dfbab7c0da4bee194968e4f81ffeccf  linux-4.9.248.tar.xz
+sha256  0e1bc32c4842c3bbee3a15454408f528acd4d3c5e83312b93008d5ee2e9a0c79  linux-4.14.212.tar.xz
+sha256  3eeec4e5eb8a129be3536357ecb028fae7d82fac933dcfac0b6089ee398fc5fc  linux-4.19.163.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a5e474fa2c..25cdc2ba33 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -350,12 +350,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.246"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.246"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.209"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.160"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.80"	if BR2_KERNEL_HEADERS_5_4
-	default "5.9.11"	if BR2_KERNEL_HEADERS_5_9
+	default "4.4.248"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.248"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.212"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.163"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.83"	if BR2_KERNEL_HEADERS_5_4
+	default "5.9.14"	if BR2_KERNEL_HEADERS_5_9
 	default "5.10"		if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
