From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 10:42:49 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 7}.x series
Message-ID: <20200829084445.D2AAD815BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=135799c7bbdcb935b5be72108d5dd22b0d81828c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3cf6d708e1d613068a20a8acc4f258aba35ec0eb)
[Peter: drop 5.7.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 23e7884e3d..b7bbbc1a3d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  62532fb257fe98a68601e4ca36bd3d34300b4f26f447bf495df4693442601ee8  linux-5.6.19.tar.xz
 sha256  1448334371fb52f511255726832464d33877a210a7350260fb18eb225ae211eb  linux-5.5.19.tar.xz
-sha256  add2ab2385c40fc9a3dfebe403e56da8500b633dc7dc42cf0c670c61d151a223  linux-5.4.60.tar.xz
+sha256  86f13d050f6389c5a1727fa81510ee8eceac795297bc584f443354609617fea4  linux-5.4.61.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  97e689dd083d780bf7bacdc17c0a9ec9e9be118507dccedf4b77eef9666ce7fc  linux-4.4.233.tar.xz
-sha256  2a6dcab0652ab181820d56b6014235a125cf933e0edf5bdbc038160fa9e7aca5  linux-4.9.233.tar.xz
-sha256  3ea4d0221a071d58703cd346a8a6ef1582a32a8c4565a4919578817444d4fae0  linux-4.14.194.tar.xz
-sha256  a4421dea5333beeaaef81312c6f415330b9e4fda6027f399a1c55f97d3da2114  linux-4.19.141.tar.xz
+sha256  6994dda988e9fb7f5661cf80ff42039016cb0044acd39f830937ba0220296388  linux-4.4.234.tar.xz
+sha256  756f8544d261e8117716c911261690e4fb5491e14c1f4612c83e0986453782e3  linux-4.9.234.tar.xz
+sha256  394f28798670240baacd9e2cce521fbd79f8da5e1fc191695b0e11381445a021  linux-4.14.195.tar.xz
+sha256  6912db1c242d72ce9c8d4ff71982ac935d97690822af5c1c6ec22412b31667a4  linux-4.19.142.tar.xz
 # Locally computed
 sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c48a3de89d..407a6b4518 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -334,11 +334,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.233"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.233"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.194"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.141"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.60"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.234"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.234"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.195"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.142"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.61"	if BR2_KERNEL_HEADERS_5_4
 	default "5.5.19"	if BR2_KERNEL_HEADERS_5_5
 	default "5.6.19"	if BR2_KERNEL_HEADERS_5_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
