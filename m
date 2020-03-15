From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 10:20:23 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.4.x series
Message-ID: <20200315090747.EAB0383EAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82768addc41b27427bea36d1d41fdeacfd3d3b18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c7a9e2be8a60720b79fd0f092369558bc98b7b05)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8ec9414f12..d57daf8d7e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.106" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.107" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 6552f9b396..9c63745302 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256  b6aa65ee2c0767864175e3a9cf7b0b3751263b04a7c8a6e760e9b982282fa76c  linux-4.4.214.tar.xz
-sha256  b47f093dac7034c7c4722e80042c05e4ef53c14a4f28aa992117a127d2b1e483  linux-4.9.214.tar.xz
-sha256  4fe02489e4b4a187eccf0ef87df6100534c9d485e76d876b1fa247c7635332a0  linux-4.14.171.tar.xz
-sha256  63c8bd76a9b282e18112f8ff9e3fd41e3d1df9f9b7248ea1a370b05a827e9cda  linux-4.19.106.tar.xz
+sha256  28bcd3d4201da9feefdf3bcd65c516dd674acbbf45681ce3c7d784c53b33fe03  linux-4.4.215.tar.xz
+sha256  236f2f47853700f22b9925cb17917d97ff7120fcc8110ec827c5a030a8129f48  linux-4.9.215.tar.xz
+sha256  2318a1ab937580a079351ed20557c336a3d95b664f667b14e3ba49e3271b217a  linux-4.14.172.tar.xz
+sha256  654bac198d38e03e7bff9e2642b01f498dc0fa5d06198edd14bc30fe7fbf0240  linux-4.19.107.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 17a4aa7cf1..0f32941b12 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.214"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.214"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.171"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.106"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.215"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.215"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.172"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.107"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
