From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 17:07:53 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19, 20}.x series
Message-ID: <20190129160851.3F74281499@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71da6e77c2bf61cbc307ad7806cc5c27ed328224
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d9dcf1c5c11aeebbde16b1f98cf31590a92b6205)
[Peter: drop 4.19.x/4.20.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index f04d6927fa..1e5d76d5ac 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 68ac319e0fb7edd6b6051541d9cf112cd4f77a29e16a69ae1e133ff51117f653  linux-4.18.20.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
-sha256 5f9f1faba9a47e406de9b207d45a00d41d45e11615971ec9ef9493654cd745ad  linux-4.14.92.tar.xz
-sha256 165bd3b42e8f99e62238f711d2c0100ad411bc69588c65fb3a22c190dc35d783  linux-4.9.149.tar.xz
-sha256 06f1b080332251628727e42d21b4530035f03f00d75432199b2548172b1650a9  linux-4.4.169.tar.xz
+sha256 e728518bb024209acc222e803cdc00d0ea2b1f4ebf28a8ed17a639171a1c23f1  linux-4.14.94.tar.xz
+sha256 15965595807e4dce34da951a806af9928b60c19d3f40773de43f606f14ed425c  linux-4.9.151.tar.xz
+sha256 fd4074da2a946368292b04c44241de37f6b30a10f4231673d0689cf6454fefa0  linux-4.4.171.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
 sha256 ad96d797571496c969aa71bf5d08e9d2a8c84458090d29a120f1b2981185a99e  linux-3.2.102.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 21fa5fd4dd..810dd5de52 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -290,9 +290,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.169"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.149"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.92"	if BR2_KERNEL_HEADERS_4_14
+	default "4.4.171"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.151"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.94"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.18.20"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
