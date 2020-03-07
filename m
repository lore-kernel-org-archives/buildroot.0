From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 22:18:51 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.4.x series
Message-ID: <20200307210640.CF8E58FC74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51f9a97831e3e831c0b74f1e91c95a38cf36b915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9228c061d5cfd11dfde9b240b7cc6653437f4e2d)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 3adb60f335..1b103df498 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 20f14917c4f33122cfa12963a7d3180fe6f4685cacfe984553b2b5b4ad20638c  linux-5.3.18.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 77df6c3c5c512516db444264242cef5370550ed58ef3f198632858b917f9d8b8  linux-4.4.211.tar.xz
-sha256 2597608d5d974cfdc015eaf6a4197b36f19d722b8a309b57e741fb02e311b1be  linux-4.9.211.tar.xz
-sha256 db5777d3a12a85bc8c130b7b250bab2283f9d964b725e5de3c216b495eeb31fe  linux-4.14.168.tar.xz
-sha256 8dbc21f994af9dc3468da4e934a641b457a57cf125d1a8e8f95fe488edd5b5ab  linux-4.19.99.tar.xz
+sha256 47e6c22722917d3609c430392b7549267c1f097ddae9dc0e7f071a6ea4c7a357  linux-4.4.212.tar.xz
+sha256 ade738a606c9b52ecf764e94b4e77116caa3a2b8abd30f4534d220ac6894be30  linux-4.9.212.tar.xz
+sha256 d88ea97993c56b1fa0b0a05061bcde476c6be4fc3bb2de8bd97a8f8ff7278249  linux-4.14.169.tar.xz
+sha256 be26156abdb38ac0576a34a235ef456bb8ca67fbbe56fc6649b8d069159f8bc4  linux-4.19.101.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 17d9ce928d..6c2b34caf0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,10 +305,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.211"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.211"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.168"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.99"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.212"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.212"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.169"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.101"	if BR2_KERNEL_HEADERS_4_19
 	default "5.3.18"	if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
