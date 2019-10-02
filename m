From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2019 08:08:56 +0200
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.19.x / 5.{2,
 3}.x series
Message-ID: <20191002060608.89BE5840EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04e9fdb1c692597c6747bbe4d46eda0db5d60607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7e236b035b..fc359cedbc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.3.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.3.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.65-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 16aa4db4cd..cb137e67ac 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 9890b5a909d316211d045a95f5f0680e39749f2319cb26d7cd067efaa692f858  linux-5.3.1.tar.xz
-sha256 7b3b8ad09ea936b4216dd02c5fc2ef39c8f58935d0a81ab9690f0fc451102df9  linux-5.2.17.tar.xz
+sha256 361f9c953bb5ca7dbc922c3f698170523667f6a2f43961ffb88fa47b6b10fc6b  linux-5.3.2.tar.xz
+sha256 6d090f866c9739403f78b08470209d1e825c44ce5dbaa237a4a2c8c6609dca60  linux-5.2.18.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 dd5e7147e1e4501560fba5beb86dae6bf6ba843518ab3d4cad283de77b651b78  linux-4.19.75.tar.xz
+sha256 ba4dd29902734b263a5197410363b17f30dc60bc999bd6ce90b6f5910b971e66  linux-4.19.76.tar.xz
 sha256 a3c54b887ea3e679382bd4c0536e6a281b071dab2258bd3ee8af75baef2023f5  linux-4.14.146.tar.xz
 sha256 d5f4bb7584e461f1faa9a3f94c2ad292246fe692b0e992e072dac255f806c2e3  linux-4.9.194.tar.xz
 sha256 d5f4bb7584e461f1faa9a3f94c2ad292246fe692b0e992e072dac255f806c2e3  linux-4.9.194.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 39cb849b7f..5942d70576 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -316,10 +316,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.194"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.194"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.146"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.75"	if BR2_KERNEL_HEADERS_4_19
+	default "4.19.76"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
-	default "5.2.17"	if BR2_KERNEL_HEADERS_5_2
-	default "5.3.1"		if BR2_KERNEL_HEADERS_5_3
+	default "5.2.18"	if BR2_KERNEL_HEADERS_5_2
+	default "5.3.2"		if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
