From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Nov 2019 21:51:02 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.3.x series
Message-ID: <20191117204620.637DC8F12B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f986f0a717dec353100454bb27bc26045b2ef82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3b722cdc4b6f7f6a265be8b76538dc5e62b543be)
[Peter: drop 5.3.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 4146ce208a..7256c67835 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,7 +2,7 @@
 sha256 9a8ee3ff75dabffa76141c8dc7529dfbb3ca07888a3708a13f15b412268b3538  linux-5.2.21.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 293ec1ae0f6b3b4be83a217224b51d137f2163cf2d9d294eecf5d0a354e4e29d  linux-4.19.81.tar.xz
-sha256 ff519c428ee9bbb513a84db5ec32a7e3705cd8c23a57104b25b944cb79583fae  linux-4.14.151.tar.xz
-sha256 9572ebfa6ba0efcf9f1ec7b62c7b89baa36a621ab9fd4c5ad025196c549605ac  linux-4.9.198.tar.xz
-sha256 ecf808d88d04086da25bf44288d63a7110dd99948c17bc1162e5301abccff312  linux-4.4.198.tar.xz
+sha256 58d96d6c2c5ee8288fe9714891e4037a18f457b008e369e33fc744afc2cb595d  linux-4.19.82.tar.xz
+sha256 a9239fd9d341aae07b48a8e7a2afd528fe5cde2617d783454c71e6f3dae2b0aa  linux-4.14.152.tar.xz
+sha256 0f2531f0908e320ee49954e8d84406db659073b202abc514bcc999ceaa3f7ed5  linux-4.9.199.tar.xz
+sha256 1739b0991407c94b328ceab27d77f25a1a3ae03367e8b800e5964a99789165f0  linux-4.4.199.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8924643d20..b4cb952eee 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,10 +305,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.198"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.198"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.151"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.81"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.199"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.199"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.152"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.82"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default "5.2.21"	if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
