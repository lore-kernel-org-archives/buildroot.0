From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2019 12:14:10 +0100
Subject: [Buildroot] [git commit] {linux,
 linux-headers}: bump 5.4 series to 5.4.1
Message-ID: <20191202110750.F26F283871@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5fd68a4547ec3938ee56687398689e1fda67ede
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3d68ba1ebc..46b66c2518 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -133,7 +133,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.82-cip14" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.72-cip10-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index cb9e7c1b6f..dfd66461d2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 955712688c7256675383ec5be4ee044dbb59116a9a1f24e8689d12a6f95f7932  linux-5.3.14.tar.xz
-sha256 bf338980b1670bca287f9994b7441c2361907635879169c64ae78364efc5f491  linux-5.4.tar.xz
+sha256 a7d48bb324d53e421ffbe4da40087b3c0c5112707e5f3d827c30118542c74fd9  linux-5.4.1.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 fa1f8fe9c12e18e5cda18cf759b77ae9e778e1e9006d837426c955b75bd4eaa6  linux-4.4.205.tar.xz
 sha256 98b9e8644706acc0cf51022372bb263b59a1d2bbe3ccd7ce6bd9bc7378c78b05  linux-4.9.205.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3ff2b05b19..a42d29ce2d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -318,7 +318,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.157"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.87"	if BR2_KERNEL_HEADERS_4_19
 	default "5.3.14"	if BR2_KERNEL_HEADERS_5_3
-	default "5.4" 		if BR2_KERNEL_HEADERS_5_4
+	default "5.4.1"		if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
