From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 15:51:58 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 5, 6}.x series
Message-ID: <20200408133821.155D08DF7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa55ccbef81f8161a356e92521534ffd64aea602
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 79c640e2e0d15e430a94915f48826b955f83cb63)
[Peter: drop 5.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 78b82b631f..60bbcbb03d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.112" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.114" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index c838b0f7cc..4d35dfadc4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256  fdeac4c05fcca993927fdce51446b4f81725f54e753fea02b0b2dacf3d64526f  linux-4.4.217.tar.xz
-sha256  6fb2a54602ebf750a39ba9750dc8d3bc34308518647f5bd2f562dee4d2566819  linux-4.9.217.tar.xz
-sha256  4c223ca3565d4267b403f7432860d87c8301767eb654d046d268782b18155189  linux-4.14.174.tar.xz
-sha256  24c2b11cc0ed57a90de776436efc21dd4345583b1a25d92ed49e71031fc73e7a  linux-4.19.112.tar.xz
+sha256  ea68cb8e9fa255bb1d0402c5aa8f26984f9b1c8607ff3bed5d3284109167f063  linux-4.4.218.tar.xz
+sha256  df3a6e615ec4c57b04775e9c018c67045223ac662e696d28fd37baa5114349cd  linux-4.9.218.tar.xz
+sha256  cb440ac5d20071dcb482e5062958514064b0c5a8375c92653062ea201ae0222c  linux-4.14.175.tar.xz
+sha256  1e40a0dc6afc95a259f97b80d5f5ef8f89e2ee49e993ba6844e2bc55de361f0e  linux-4.19.114.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a918172a54..5d762f481b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.217"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.217"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.174"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.112"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.218"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.218"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.175"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.114"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
