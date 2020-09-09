From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Sep 2020 22:42:16 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.4.x series
Message-ID: <20200909203528.5399C7FA14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95463fa943dbdf31f4014c27fa6d603a78b7b976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d25b9ead1ec73838222a3cc99541c2a161b5657f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index b7bbbc1a3d..8606d69215 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  62532fb257fe98a68601e4ca36bd3d34300b4f26f447bf495df4693442601ee8  linux-5.6.19.tar.xz
 sha256  1448334371fb52f511255726832464d33877a210a7350260fb18eb225ae211eb  linux-5.5.19.tar.xz
-sha256  86f13d050f6389c5a1727fa81510ee8eceac795297bc584f443354609617fea4  linux-5.4.61.tar.xz
+sha256  e0260dae0da01163b1a3289ad9c5cc6ee4226720e199e8a1d982e24efda7ffc0  linux-5.4.63.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  6994dda988e9fb7f5661cf80ff42039016cb0044acd39f830937ba0220296388  linux-4.4.234.tar.xz
-sha256  756f8544d261e8117716c911261690e4fb5491e14c1f4612c83e0986453782e3  linux-4.9.234.tar.xz
-sha256  394f28798670240baacd9e2cce521fbd79f8da5e1fc191695b0e11381445a021  linux-4.14.195.tar.xz
-sha256  6912db1c242d72ce9c8d4ff71982ac935d97690822af5c1c6ec22412b31667a4  linux-4.19.142.tar.xz
+sha256  0dfb86052e7405692e29f8db2f5b480ed972d93b615ffb24d4607d33d29eb770  linux-4.4.235.tar.xz
+sha256  e625a6212695efe5deeab5844e47404841fb1bf755f85eba818614c2ff580cc3  linux-4.9.235.tar.xz
+sha256  5e61b2f58d4c930c3567821aeeb6f688554dca61454646d54711bfc9abc7b09a  linux-4.14.196.tar.xz
+sha256  2a4335c66f0ea8cc49d89ab25e5e00d75fcb33fe638d5584855598b4b8f3038d  linux-4.19.143.tar.xz
 # Locally computed
 sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5c4b7c28f4..0c6f791f2f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -334,11 +334,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.234"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.234"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.195"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.142"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.61"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.235"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.235"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.196"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.143"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.63"	if BR2_KERNEL_HEADERS_5_4
 	default "5.5.19"	if BR2_KERNEL_HEADERS_5_5
 	default "5.6.19"	if BR2_KERNEL_HEADERS_5_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
