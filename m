From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Feb 2019 21:47:04 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19, 20}.x series
Message-ID: <20190214205206.06C6888FEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4bbdeec9d2a9e46041d48d14fe45dcca03bb480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a1cdea102d..323ba38d72 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.18" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.21" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.171-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index ba67e10c61..e769f132f0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 ff8d96974a947a6332b3a2dda461c1b2df8175b56fa4ab9398224e6e1800e214  linux-4.20.5.tar.xz
-sha256 5ffdc068f9bf768b7cd5a8a2271d1370c2326e967848b13e21dfdbb1ef0ff3f1  linux-4.19.18.tar.xz
-sha256 110daeae1a416b7e0ec8dce5e86d67552deeb4567f696c3869389be239f0ecb5  linux-4.14.96.tar.xz
-sha256 9066929ec2550794ae107350a5f3c5b648438aa915cfc62bac5b7a54b9d7731a  linux-4.9.153.tar.xz
-sha256 fb4d16b3c1e508dfa0344e406caeb25286d1c258421d8891b5580323e4e639fb  linux-4.4.172.tar.xz
+sha256 b60ca6c44aa3bc98384944d73ed94229e6359dc61a88fa589027dac30e04d062  linux-4.20.8.tar.xz
+sha256 db08ede726fe410da274e1e98f0de2aed9ff4b0e0b63a89e5928bef46998bbc1  linux-4.19.21.tar.xz
+sha256 8ff98caed5b20b733dedcbe99559d71a0e09e239c0c2488b3fd799c96489eb0a  linux-4.14.99.tar.xz
+sha256 5eb1b9ba43370512ab637452089bb93f8c0fdd7d5399e99561d382f74517a816  linux-4.9.156.tar.xz
+sha256 be5211dd90142568199cd546c0893e1eb71c78774a11660a8bb8070bb9ebba39  linux-4.4.174.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a6055e75b9..4dc1e26d5d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,11 +287,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.172"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.153"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.96"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.18"	if BR2_KERNEL_HEADERS_4_19
-	default "4.20.5"	if BR2_KERNEL_HEADERS_4_20
+	default "4.4.174"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.156"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.99"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.21"	if BR2_KERNEL_HEADERS_4_19
+	default "4.20.8"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
