From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:09:51 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.3.x series
Message-ID: <20191203130351.28F4283FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfaf694cfe53799347b6117e241353455dab2a39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: drop 5.3.x bump]
(cherry picked from commit 30c05ff3fc48c988ddbd481662d0a6769fdf0887)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index a469d5549c..ce03224940 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,7 +2,7 @@
 sha256 9a8ee3ff75dabffa76141c8dc7529dfbb3ca07888a3708a13f15b412268b3538  linux-5.2.21.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 fdacceeae22d1a0467cae50c15e6e754bfb8bb8e8010623df0d8fd78f4adb929  linux-4.4.202.tar.xz
-sha256 8108ec1cd10fc40821c84e9f087dba10b1767aad66596f4a36925faef55e4ebf  linux-4.9.202.tar.xz
-sha256 77d61979556b81c95b81452fa10e1fe9368cbe2f9f80a13e4669b0464722e481  linux-4.14.155.tar.xz
-sha256 7bf435970aeeafd46263f49730087a61c4858d8b8fc5a4002ceac971b45f4fb7  linux-4.19.85.tar.xz
+sha256 9262528aeaf5991c2008d7d9ea3994f9a548f000da39c0565a35f50863b4790a  linux-4.4.203.tar.xz
+sha256 1cd950cfaff8ddcc11596d970ec622fa3cdbedd75d3e28ddd3a9383f3cb2a849  linux-4.9.203.tar.xz
+sha256 f8889feb0cbd7df36ff35bd4c72c1e2010567621bfcb218fcfa501bc5c7787c0  linux-4.14.156.tar.xz
+sha256 bf2cbba319d43d1bd9e876ac0b55ab83118d1a1e61cce3c929d5371f7567bff6  linux-4.19.86.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9a8db3e239..01b30470ad 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,10 +305,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.202"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.202"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.155"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.85"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.203"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.203"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.156"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.86"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default "5.2.21"	if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
