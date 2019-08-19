From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 22:33:15 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.2.x series
Message-ID: <20190819202949.3FF43837AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd30a142c8b9dae5814af110f51096da47e6b124
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 99f50f2d43..1c8f7e5323 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.2.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.2.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.65-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 33e708fb57..7c62819165 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 c645402843f90a69426975f8923923dfc6edebb5d1bc0092560ffb7135d3cd96  linux-5.2.5.tar.xz
+sha256 b6f02a4b306ca5cd314d72615bfc2650166969613135da202630e6c4e1b5d4e6  linux-5.2.9.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 75988760b931864b46292dcfad1dd54b3f4da10168041f48ca6d7f6dd4e5d25d  linux-4.19.63.tar.xz
-sha256 429121e27971597044fb9efa19d25dcad76f5ef5c4e2d5270e674948e4055b74  linux-4.14.135.tar.xz
-sha256 242484430d0729791d8efd92181b7d34b4021050646c6e00cf459866eab94b6a  linux-4.9.186.tar.xz
-sha256 0b1273d35c0664234e069f1ba894161b466679f6e1053f44fcf4098290937984  linux-4.4.186.tar.xz
+sha256 5a1c3d60c38a7a0a086fcd6fdce5603c31c487852b1b64c071ee6de62c98a502  linux-4.19.67.tar.xz
+sha256 8c62d495444dba90200740ec770d274780b010e957cfc447f07999d717e37042  linux-4.14.139.tar.xz
+sha256 93d945661246f726b694455c80c140717d2beff5a718445a51183439bbe5d0b3  linux-4.9.189.tar.xz
+sha256 974239a3b7713de2ed46da06446cf0a87e97c871d89a87a71f3521fe84d98859  linux-4.4.189.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d677468a3d..c5eb1fb418 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,12 +305,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.186"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.186"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.135"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.63"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.189"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.189"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.139"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.67"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
-	default "5.2.5"		if BR2_KERNEL_HEADERS_5_2
+	default "5.2.9"		if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
