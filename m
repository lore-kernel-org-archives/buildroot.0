From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jan 2020 08:24:01 +0100
Subject: [Buildroot] [git commit] {linux,
 linux-headers}: bump 4.19.x / 5.4.x series
Message-ID: <20200106071504.D642A8EE2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41ca1dc1ac62ad7edd9178a313d6744f9c63c694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 80cfb9e300..0542619c9f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.88-cip16" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.82-cip14-rt5" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 454d51d227..7e4be4086f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 abc9b21d9146d95853dac35f4c4489a0199aff53ee6eee4b0563d1b37079fcc9  linux-5.4.7.tar.xz
+sha256 42c414c902193f9e8a1b70c728ca440de02d85dc29102f52ef98cfbf20d29a52  linux-5.4.8.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 5899ff2a85e2b84607148349fd8e646f94399655caf0e4e55d1eb0567e48520e  linux-4.4.208.tar.xz
 sha256 b7ad1c9841d671d026c55a4c91c77205f8b488ca5f980f838591c68662e0525a  linux-4.9.208.tar.xz
 sha256 f65170224cd4359ce8b2793b492bd8127abdd0b91350484e001bce13f0c98b4b  linux-4.14.162.tar.xz
-sha256 29c37cf8bbfa717ce98bc931371c35fcee3482734ad5faba32d02aff209883a2  linux-4.19.92.tar.xz
+sha256 2af5d23f82a8bf69a6e4d8407579293b7beeebd3054dc464d48bdb5d2d7f5834  linux-4.19.93.tar.xz
 # Locally computed
 sha256 6d60ce76bce2e1938f64027d12b1988c95245751feb635adfc551a021d5b3f26  linux-cip-4.19.88-cip16.tar.gz
 sha256 74ec782e11344e5c5db8e48899b464e296ef37acfb43ce7dfb01c09ea8d3e959  linux-cip-4.19.82-cip14-rt5.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6977d6d422..1b479a5c4d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -312,8 +312,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.208"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.208"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.162"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.92"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.7"		if BR2_KERNEL_HEADERS_5_4
+	default "4.19.93"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.8"		if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
