From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 May 2019 23:40:20 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x / 5.0.x series
Message-ID: <20190508214035.8B27E813E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5b7a75b16af1ebafdaa501618ac8bce9024ee33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0a79bb4871a0f091b012421789b8bae56bf09707)
[Peter: drop 5.0.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f6294e708d..cf0e04111a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.37" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.38" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 15b2f0df78..4a92c35a49 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 ecb0b30ec32c0c7d614c394158c7d37099a815507ed62235cca32052d7ff9c65  linux-4.19.37.tar.xz
-sha256 b75e1dcfabc8d18051a07cbf9b60eaee8ac470a2311fed20447fd0d022c19e15  linux-4.14.114.tar.xz
-sha256 431cd992bf74da9851dd5938dbe45ff7577219b84b237ae5e30067d483b57f01  linux-4.9.171.tar.xz
+sha256 6a3fdfa02dbc61ee8120ff0947a6eb0d6595b9bbe27e30a1b6f53b905f0bcd7f  linux-4.19.38.tar.xz
+sha256 b7ae61711a1323053d68fd47911b92977afd526d302755518e42744251516186  linux-4.14.115.tar.xz
+sha256 49428e30989cc0b069a6f4b7bc08988deb02d10f910ca0c4d1e44b22155eb40e  linux-4.9.172.tar.xz
 sha256 2c6a9d2765ef182f2470afed5af74de6c435ba9aaf422af54db8c5dc2b4f27d1  linux-4.4.179.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 42d13c5496..1dce8707e0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -288,9 +288,9 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.179"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.171"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.114"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.37"	if BR2_KERNEL_HEADERS_4_19
+	default "4.9.172"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.115"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.38"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
