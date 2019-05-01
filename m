From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 21:51:49 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.0.x series
Message-ID: <20190501201631.998B6839E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffebec71410f2e5340cc72cb50d454506b18c110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3fd23becd40995e8b1f997b9bf63ac19fff1be18)
[Peter: drop 5.0.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f35c9ec4d6..f6294e708d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.36" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.37" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 76cc547206..15b2f0df78 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 b808b508177f9d288d94a3b9df7b01d5eac9fcc1804a794c913b2144de63f2bc  linux-4.19.36.tar.xz
-sha256 b24df2e37faaf2290999c507f9e29de98494f52429bcd35513c5b3e52eaddac2  linux-4.14.113.tar.xz
-sha256 33887b40fc8e0b71f423bb7afe112a4ae190378145f4a3f3892c563b7e43131d  linux-4.9.170.tar.xz
-sha256 c3598c22b7994b3bebc3059e8ab85bc212c53550eb401baab3f29f8d007a043d  linux-4.4.178.tar.xz
+sha256 ecb0b30ec32c0c7d614c394158c7d37099a815507ed62235cca32052d7ff9c65  linux-4.19.37.tar.xz
+sha256 b75e1dcfabc8d18051a07cbf9b60eaee8ac470a2311fed20447fd0d022c19e15  linux-4.14.114.tar.xz
+sha256 431cd992bf74da9851dd5938dbe45ff7577219b84b237ae5e30067d483b57f01  linux-4.9.171.tar.xz
+sha256 2c6a9d2765ef182f2470afed5af74de6c435ba9aaf422af54db8c5dc2b4f27d1  linux-4.4.179.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ff3d464f41..42d13c5496 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,10 +287,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.178"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.170"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.113"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.36"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.179"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.171"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.114"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.37"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
