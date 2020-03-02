From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  2 Mar 2020 22:49:20 +0100
Subject: [Buildroot] [PATCH] linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.4.x series
Message-ID: <20200302214920.10189-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a5c736e43e..7d1cc576d7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.22" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.23" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 7df6953feb..c8ddabde86 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  661bcb8d7e390dcc28e53795485e648f2bdc9b697b731459cc2bcc9ceb4a7d1a  linux-5.4.22.tar.xz
+sha256  3f28aacdf5deddfdf80bb949884699b96053a3548dc3434552d30dc0bc781eca  linux-5.4.23.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  b6aa65ee2c0767864175e3a9cf7b0b3751263b04a7c8a6e760e9b982282fa76c  linux-4.4.214.tar.xz
-sha256  b47f093dac7034c7c4722e80042c05e4ef53c14a4f28aa992117a127d2b1e483  linux-4.9.214.tar.xz
-sha256  4fe02489e4b4a187eccf0ef87df6100534c9d485e76d876b1fa247c7635332a0  linux-4.14.171.tar.xz
-sha256  63c8bd76a9b282e18112f8ff9e3fd41e3d1df9f9b7248ea1a370b05a827e9cda  linux-4.19.106.tar.xz
+sha256  28bcd3d4201da9feefdf3bcd65c516dd674acbbf45681ce3c7d784c53b33fe03  linux-4.4.215.tar.xz
+sha256  236f2f47853700f22b9925cb17917d97ff7120fcc8110ec827c5a030a8129f48  linux-4.9.215.tar.xz
+sha256  2318a1ab937580a079351ed20557c336a3d95b664f667b14e3ba49e3271b217a  linux-4.14.172.tar.xz
+sha256  654bac198d38e03e7bff9e2642b01f498dc0fa5d06198edd14bc30fe7fbf0240  linux-4.19.107.tar.xz
 # Locally computed
 sha256  18f9ddba0b777d1942d6c81877ba97c4bcd08488e2c409e57dcce866b9de5fc2  linux-cip-4.19.98-cip19.tar.gz
 sha256  7d5aeb67da41dc66ef28621ef994ef4403e8b1f5c3df38b1843da20972444280  linux-cip-4.19.98-cip19-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c2f7b12889..3fd8010a04 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -318,11 +318,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.214"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.214"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.171"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.106"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.22"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.215"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.215"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.172"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.107"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.23"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1
