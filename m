From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 08:48:27 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{0, 1}.x series
Message-ID: <20190606064907.63653812B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=292da079d76ed485676abe7e5a4d0a594928a54b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: drop 5.{0, 1}.x bump]
(cherry picked from commit 24a9a7894d7f176e870b19a7f69d920760ffcf62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 63ff4b8849..b6faa508b7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.43" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.44" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 9941af6e65..e80946ce59 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 111619a1fab2368bf4da05c079e44bf25ee00ee250694c1b8e536f2ed5d2df57  linux-4.19.43.tar.xz
-sha256 5615b713389d74044eaa57032dab674228116b63ed358086c33bd929d7ad3b7c  linux-4.14.119.tar.xz
-sha256 2a94d008c0737f01d4b78f669a3c40e334cacebe4d62eb25252171cee205b178  linux-4.9.176.tar.xz
-sha256 2c6a9d2765ef182f2470afed5af74de6c435ba9aaf422af54db8c5dc2b4f27d1  linux-4.4.179.tar.xz
+sha256 707642e993775618a5afa039b1058fa49f1c0faada46e8cdcb976241bca6b288  linux-4.19.44.tar.xz
+sha256 ddb8e86cf65e6f53f782bc46f026823b6b3fc472aa1385b601f22dce2dbccb4c  linux-4.14.120.tar.xz
+sha256 c73b1e3ebcc35b653f7b673ca151fc67b814bdb27269799fa7cda251827887ee  linux-4.9.177.tar.xz
+sha256 1a450217d381bb7fd259d026d3b7a57c717e8d1f66754cd6fcc9df3c4a8a6a7a  linux-4.4.180.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 74b30e39bc..6ceee05942 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.179"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.176"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.119"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.43"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.180"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.177"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.120"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.44"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
