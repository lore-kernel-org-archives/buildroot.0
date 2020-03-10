From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 23:12:40 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.4.x series
Message-ID: <20200310220142.66DC590895@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2176fd19f2ef24449dbeb9ced523cafa9bb66158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e5e84823bbfef69504511cb32741432c7b834707)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 1b103df498..f2e453cbf5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 20f14917c4f33122cfa12963a7d3180fe6f4685cacfe984553b2b5b4ad20638c  linux-5.3.18.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 47e6c22722917d3609c430392b7549267c1f097ddae9dc0e7f071a6ea4c7a357  linux-4.4.212.tar.xz
-sha256 ade738a606c9b52ecf764e94b4e77116caa3a2b8abd30f4534d220ac6894be30  linux-4.9.212.tar.xz
-sha256 d88ea97993c56b1fa0b0a05061bcde476c6be4fc3bb2de8bd97a8f8ff7278249  linux-4.14.169.tar.xz
-sha256 be26156abdb38ac0576a34a235ef456bb8ca67fbbe56fc6649b8d069159f8bc4  linux-4.19.101.tar.xz
+sha256  00f73c3c7a2beebf5832422c81a037b05ca1217d5f4f6cbcc49284bf7fb2bcb2  linux-4.4.213.tar.xz
+sha256  af85ff764670c2a934ee5b2590437d8e3ab32b1a0b8d51358f36c6bbf6c5eb64  linux-4.9.213.tar.xz
+sha256  940a63247d11476daea6d114a9599be0eb68eeb2e295fe279e0f3312af1e17c3  linux-4.14.170.tar.xz
+sha256  302e8388dd7b49d1b779225cf865af74b9837d1e955b1b290fdd71baf97ce015  linux-4.19.102.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6c2b34caf0..4f32334487 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,10 +305,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.212"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.212"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.169"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.101"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.213"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.213"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.170"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.102"	if BR2_KERNEL_HEADERS_4_19
 	default "5.3.18"	if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
