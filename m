From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 22:20:03 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.3.x series
Message-ID: <20191031212141.584E78E36F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cd3bd5b10912c7862c0f2b40d5b46e3d7f6ea63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6646b220af9db55933dbf4d264f47b9c42de1d3b)
[Peter: drop 5.3.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 3f7b6ad750..4146ce208a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,7 +2,7 @@
 sha256 9a8ee3ff75dabffa76141c8dc7529dfbb3ca07888a3708a13f15b412268b3538  linux-5.2.21.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 80a9ba764e088aa7fddfef5a97c0236905e291468a37832243b6f3828d36e7ec  linux-4.19.80.tar.xz
-sha256 65c5a4b86b858ba58642f46ae8c983990376d1946e59cc7e054e85b1b7eb57b0  linux-4.14.150.tar.xz
-sha256 553568b6728d505da70efa8247a66ad158e849c8f5f40d715612ef4e9ed14a0c  linux-4.9.197.tar.xz
-sha256 9cf484511e51861486d2eafc7373f9e47f9c1f50a82e30614073b51570a0ee7a  linux-4.4.197.tar.xz
+sha256 293ec1ae0f6b3b4be83a217224b51d137f2163cf2d9d294eecf5d0a354e4e29d  linux-4.19.81.tar.xz
+sha256 ff519c428ee9bbb513a84db5ec32a7e3705cd8c23a57104b25b944cb79583fae  linux-4.14.151.tar.xz
+sha256 9572ebfa6ba0efcf9f1ec7b62c7b89baa36a621ab9fd4c5ad025196c549605ac  linux-4.9.198.tar.xz
+sha256 ecf808d88d04086da25bf44288d63a7110dd99948c17bc1162e5301abccff312  linux-4.4.198.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1c2d269a0f..8924643d20 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,10 +305,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.197"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.197"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.150"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.80"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.198"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.198"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.151"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.81"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default "5.2.21"	if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
