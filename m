From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 22:43:25 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.4.x series
Message-ID: <20200203213900.8A3AA88FE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9228c061d5cfd11dfde9b240b7cc6653437f4e2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ae5b1860a6..6b96d53beb 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.15" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.17" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.94-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.90-cip16-rt6" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index e198393da7..940a90ed9d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 6407222f850f685b346011bd696a3216d5df0f37e0184099100d2724396d94b1  linux-5.4.15.tar.xz
+sha256 945f2bf6af69eed0ac81ef75b571f37ae1e16a9bb8a2ae698a365ee3ec2c74b9  linux-5.4.17.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 77df6c3c5c512516db444264242cef5370550ed58ef3f198632858b917f9d8b8  linux-4.4.211.tar.xz
-sha256 2597608d5d974cfdc015eaf6a4197b36f19d722b8a309b57e741fb02e311b1be  linux-4.9.211.tar.xz
-sha256 db5777d3a12a85bc8c130b7b250bab2283f9d964b725e5de3c216b495eeb31fe  linux-4.14.168.tar.xz
-sha256 8dbc21f994af9dc3468da4e934a641b457a57cf125d1a8e8f95fe488edd5b5ab  linux-4.19.99.tar.xz
+sha256 47e6c22722917d3609c430392b7549267c1f097ddae9dc0e7f071a6ea4c7a357  linux-4.4.212.tar.xz
+sha256 ade738a606c9b52ecf764e94b4e77116caa3a2b8abd30f4534d220ac6894be30  linux-4.9.212.tar.xz
+sha256 d88ea97993c56b1fa0b0a05061bcde476c6be4fc3bb2de8bd97a8f8ff7278249  linux-4.14.169.tar.xz
+sha256 be26156abdb38ac0576a34a235ef456bb8ca67fbbe56fc6649b8d069159f8bc4  linux-4.19.101.tar.xz
 # Locally computed
 sha256 6d60ce76bce2e1938f64027d12b1988c95245751feb635adfc551a021d5b3f26  linux-cip-4.19.88-cip16.tar.gz
 sha256 74ec782e11344e5c5db8e48899b464e296ef37acfb43ce7dfb01c09ea8d3e959  linux-cip-4.19.82-cip14-rt5.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a8dca5d09a..9f46a1052b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -309,11 +309,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.211"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.211"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.168"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.99"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.15"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.212"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.212"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.169"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.101"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.17"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
