From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2019 17:58:46 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] {linux,
 linux-headers}: bump 4.19.x / 5.{2, 3}.x series
Message-ID: <20191002155655.2E83788081@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=668fe091f83bcb4550da755fca3f0547b2752e6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 04e9fdb1c692597c6747bbe4d46eda0db5d60607)
[Peter: drop 5.3.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 316687b000..edcafe47ab 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.2.17" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.2.18" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.65-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 366d52e9f0..790bef883b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 7b3b8ad09ea936b4216dd02c5fc2ef39c8f58935d0a81ab9690f0fc451102df9  linux-5.2.17.tar.xz
+sha256 6d090f866c9739403f78b08470209d1e825c44ce5dbaa237a4a2c8c6609dca60  linux-5.2.18.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 dd5e7147e1e4501560fba5beb86dae6bf6ba843518ab3d4cad283de77b651b78  linux-4.19.75.tar.xz
+sha256 ba4dd29902734b263a5197410363b17f30dc60bc999bd6ce90b6f5910b971e66  linux-4.19.76.tar.xz
 sha256 a3c54b887ea3e679382bd4c0536e6a281b071dab2258bd3ee8af75baef2023f5  linux-4.14.146.tar.xz
 sha256 d5f4bb7584e461f1faa9a3f94c2ad292246fe692b0e992e072dac255f806c2e3  linux-4.9.194.tar.xz
 sha256 d5f4bb7584e461f1faa9a3f94c2ad292246fe692b0e992e072dac255f806c2e3  linux-4.9.194.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2da8b1dda4..9a0cc2ea00 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -308,9 +308,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.194"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.194"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.146"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.75"	if BR2_KERNEL_HEADERS_4_19
+	default "4.19.76"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
-	default "5.2.17"	if BR2_KERNEL_HEADERS_5_2
+	default "5.2.18"	if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
