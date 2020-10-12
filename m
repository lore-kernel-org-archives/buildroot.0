From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 10:18:52 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 8}.x series
Message-ID: <20201012081026.CDF5D8F3AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad99c98f02d61bb942f941c94157211369c98a07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4dbae8ed2c0161caecf6ccfd5fe288e1517550ac)
[Peter: drop 5.8.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 8a96660fe5..f14d16fd8b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  62532fb257fe98a68601e4ca36bd3d34300b4f26f447bf495df4693442601ee8  linux-5.6.19.tar.xz
 sha256  1448334371fb52f511255726832464d33877a210a7350260fb18eb225ae211eb  linux-5.5.19.tar.xz
-sha256  a8b31d716b397303a183e42ad525ff2871024a43e3ea530d0fdf73b7f9d27da7  linux-5.4.69.tar.xz
+sha256  c0b3d8085c5ba235df38b00b740e053659709e8a5ca21957a239f6bc22c45007  linux-5.4.70.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  067814035c17e77dee84076dcc06a95eb675344cd926b7b79a16b80fee593364  linux-4.4.238.tar.xz
 sha256  b1eaf60b771ec4df0546d2b7539e164355008ea2f680a0642ae430e9cb134a3f  linux-4.9.238.tar.xz
 sha256  5d404a0224a34b5379f1871cc46825487d557c2660459d2b5c3cd4871d699a38  linux-4.14.200.tar.xz
-sha256  d9cdcb9a66942a56b91c8d4b273d15a3c5b8e59fad44b79e03362cfffaa62a00  linux-4.19.149.tar.xz
+sha256  f2f709ef086a4d8cb3c15a857daa44dfecf1b88d7d7c53c980fb180f6dccbace  linux-4.19.150.tar.xz
 # Locally computed
 sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 26370d3456..c334fd9be1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -337,8 +337,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.238"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.238"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.200"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.149"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.69"	if BR2_KERNEL_HEADERS_5_4
+	default "4.19.150"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.70"	if BR2_KERNEL_HEADERS_5_4
 	default "5.5.19"	if BR2_KERNEL_HEADERS_5_5
 	default "5.6.19"	if BR2_KERNEL_HEADERS_5_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
