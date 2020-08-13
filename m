From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 21:09:47 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] {linux,
 linux-headers}: bump 5.6.x series
Message-ID: <20200813190540.033A68613E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbec04f7b33066db7141c6ef755d3479dc292afd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 421cd1a3eb..e43d1dad6c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.6.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.6.19" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 0cd011f2f7..41c296ce66 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  25504b4de7baf912071d1ed40b13af0689305442b9dea9218fd096d8bd997cf7  linux-5.6.16.tar.xz
+sha256  62532fb257fe98a68601e4ca36bd3d34300b4f26f447bf495df4693442601ee8  linux-5.6.19.tar.xz
 sha256  1448334371fb52f511255726832464d33877a210a7350260fb18eb225ae211eb  linux-5.5.19.tar.xz
 sha256  faa7b6f99220d5726f0eaee74a6394f0a3b89be1a75254f3804630211f3d6d21  linux-5.4.53.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index aa9f257a29..672e738619 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -340,7 +340,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.134"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.53"	if BR2_KERNEL_HEADERS_5_4
 	default "5.5.19"	if BR2_KERNEL_HEADERS_5_5
-	default "5.6.16"	if BR2_KERNEL_HEADERS_5_6
+	default "5.6.19"	if BR2_KERNEL_HEADERS_5_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
