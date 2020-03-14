From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 17:37:45 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.19.x / 5.4.x series
Message-ID: <20200314162516.885B3836E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f5276c808ae67997fcf96605798b81d941b93b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit db4954c71d59f53b13ffe47ee2575a552f828d2d)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5e7a38472e..8ec9414f12 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.104" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.106" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index d524124aa9..6552f9b396 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -3,4 +3,4 @@ sha256  d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-
 sha256  b6aa65ee2c0767864175e3a9cf7b0b3751263b04a7c8a6e760e9b982282fa76c  linux-4.4.214.tar.xz
 sha256  b47f093dac7034c7c4722e80042c05e4ef53c14a4f28aa992117a127d2b1e483  linux-4.9.214.tar.xz
 sha256  4fe02489e4b4a187eccf0ef87df6100534c9d485e76d876b1fa247c7635332a0  linux-4.14.171.tar.xz
-sha256  23ebffb28c2607682fcb91df90d77467ac5b16a50961de298ef266a919d66be8  linux-4.19.104.tar.xz
+sha256  63c8bd76a9b282e18112f8ff9e3fd41e3d1df9f9b7248ea1a370b05a827e9cda  linux-4.19.106.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4b3740d1d4..17a4aa7cf1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -290,7 +290,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.214"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.214"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.171"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.104"	if BR2_KERNEL_HEADERS_4_19
+	default "4.19.106"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
