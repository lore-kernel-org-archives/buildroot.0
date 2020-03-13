From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 17:11:21 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.4.x series
Message-ID: <20200313160018.392978FE3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e42c849b32e5155ef31d63b4a05ab66c18d5a860
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dc43b918ec76289f58463868a0295ffd78a01440)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 9 ++++-----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index f2e453cbf5..4ebaf892ba 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 20f14917c4f33122cfa12963a7d3180fe6f4685cacfe984553b2b5b4ad20638c  linux-5.3.18.tar.xz
-# From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  00f73c3c7a2beebf5832422c81a037b05ca1217d5f4f6cbcc49284bf7fb2bcb2  linux-4.4.213.tar.xz
-sha256  af85ff764670c2a934ee5b2590437d8e3ab32b1a0b8d51358f36c6bbf6c5eb64  linux-4.9.213.tar.xz
-sha256  940a63247d11476daea6d114a9599be0eb68eeb2e295fe279e0f3312af1e17c3  linux-4.14.170.tar.xz
-sha256  302e8388dd7b49d1b779225cf865af74b9837d1e955b1b290fdd71baf97ce015  linux-4.19.102.tar.xz
+sha256  b6aa65ee2c0767864175e3a9cf7b0b3751263b04a7c8a6e760e9b982282fa76c  linux-4.4.214.tar.xz
+sha256  b47f093dac7034c7c4722e80042c05e4ef53c14a4f28aa992117a127d2b1e483  linux-4.9.214.tar.xz
+sha256  4fe02489e4b4a187eccf0ef87df6100534c9d485e76d876b1fa247c7635332a0  linux-4.14.171.tar.xz
+sha256  23ebffb28c2607682fcb91df90d77467ac5b16a50961de298ef266a919d66be8  linux-4.19.104.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4f32334487..57527154be 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,10 +305,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.213"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.213"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.170"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.102"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.214"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.214"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.171"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.104"	if BR2_KERNEL_HEADERS_4_19
 	default "5.3.18"	if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
