From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 09:00:02 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.3.x series
Message-ID: <20191119075243.CDB358EC34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b759dd7d4e74fe8950f5569c78be2196aa88dacd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1ced285fe700ac0fd13382291f5cb0a51e259239)
[Peter: drop 5.3.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 7256c67835..78e0cefb1b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,7 +2,7 @@
 sha256 9a8ee3ff75dabffa76141c8dc7529dfbb3ca07888a3708a13f15b412268b3538  linux-5.2.21.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 58d96d6c2c5ee8288fe9714891e4037a18f457b008e369e33fc744afc2cb595d  linux-4.19.82.tar.xz
-sha256 a9239fd9d341aae07b48a8e7a2afd528fe5cde2617d783454c71e6f3dae2b0aa  linux-4.14.152.tar.xz
-sha256 0f2531f0908e320ee49954e8d84406db659073b202abc514bcc999ceaa3f7ed5  linux-4.9.199.tar.xz
-sha256 1739b0991407c94b328ceab27d77f25a1a3ae03367e8b800e5964a99789165f0  linux-4.4.199.tar.xz
+sha256 868b4a92619cb00ab142a20a67f000525b9605820d1b66faa4a183133eac0660  linux-4.19.84.tar.xz
+sha256 86de4a24379a78d67fc08b2e249ccf7b689eb6c37fbe329fc3dfbe8ab4300603  linux-4.14.154.tar.xz
+sha256 383fd43bd35251636232912ad52fbc844e3c8ab792cadb62b4aefe000bacbd88  linux-4.9.201.tar.xz
+sha256 a78a85c4fb0c0835b01933765c984ab5ab190eac1d521338fb88b03a49641388  linux-4.4.201.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b4cb952eee..bf4e921776 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,10 +305,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.199"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.199"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.152"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.82"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.201"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.201"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.154"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.84"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default "5.2.21"	if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
