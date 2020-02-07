From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Feb 2020 10:04:38 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.4.x series
Message-ID: <20200207090256.994FA8892E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5e84823bbfef69504511cb32741432c7b834707
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 00871a50db..38c7510d9e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.17" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.18" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 8082a8cfba..7b3efc73ea 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  945f2bf6af69eed0ac81ef75b571f37ae1e16a9bb8a2ae698a365ee3ec2c74b9  linux-5.4.17.tar.xz
+sha256  92e9f1fd69543e9ce2a9e6eb918823b1846d2dd99246a74456263cd5ad234d89  linux-5.4.18.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  47e6c22722917d3609c430392b7549267c1f097ddae9dc0e7f071a6ea4c7a357  linux-4.4.212.tar.xz
-sha256  ade738a606c9b52ecf764e94b4e77116caa3a2b8abd30f4534d220ac6894be30  linux-4.9.212.tar.xz
-sha256  d88ea97993c56b1fa0b0a05061bcde476c6be4fc3bb2de8bd97a8f8ff7278249  linux-4.14.169.tar.xz
-sha256  be26156abdb38ac0576a34a235ef456bb8ca67fbbe56fc6649b8d069159f8bc4  linux-4.19.101.tar.xz
+sha256  00f73c3c7a2beebf5832422c81a037b05ca1217d5f4f6cbcc49284bf7fb2bcb2  linux-4.4.213.tar.xz
+sha256  af85ff764670c2a934ee5b2590437d8e3ab32b1a0b8d51358f36c6bbf6c5eb64  linux-4.9.213.tar.xz
+sha256  940a63247d11476daea6d114a9599be0eb68eeb2e295fe279e0f3312af1e17c3  linux-4.14.170.tar.xz
+sha256  302e8388dd7b49d1b779225cf865af74b9837d1e955b1b290fdd71baf97ce015  linux-4.19.102.tar.xz
 # Locally computed
 sha256  18f9ddba0b777d1942d6c81877ba97c4bcd08488e2c409e57dcce866b9de5fc2  linux-cip-4.19.98-cip19.tar.gz
 sha256  7d5aeb67da41dc66ef28621ef994ef4403e8b1f5c3df38b1843da20972444280  linux-cip-4.19.98-cip19-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 094fb9e10e..cae56701e4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -315,11 +315,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.212"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.212"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.169"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.101"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.17"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.213"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.213"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.170"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.102"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.18"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
