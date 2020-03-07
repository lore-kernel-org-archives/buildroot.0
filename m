From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 14:54:19 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.4.x series
Message-ID: <20200307134209.126F38FB5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d1d1b3d24aa42ff792c4aa111beb3d34e724ea6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6f6118ec3a4ff911283c25ce90f98cb695ede542)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index ce6ef4f6f9..3adb60f335 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 20f14917c4f33122cfa12963a7d3180fe6f4685cacfe984553b2b5b4ad20638c  linux-5.3.18.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 da02389a9c39284dca01b7ba48e845be3dd5ce0fed0b5f30150d8d303429e7dd  linux-4.4.210.tar.xz
-sha256 a0915203836d02cc3cd70252904700412c4a409737a81b392465fb70d7625313  linux-4.9.210.tar.xz
-sha256 8bb2bf811a2092933a2386a4e679cd0c88de979c10fbb463d8142add4e577c00  linux-4.14.166.tar.xz
-sha256 8fb2a328e05e545274e721cf84baaf612b9330febc6f581b9ead81eaf41496da  linux-4.19.97.tar.xz
+sha256 77df6c3c5c512516db444264242cef5370550ed58ef3f198632858b917f9d8b8  linux-4.4.211.tar.xz
+sha256 2597608d5d974cfdc015eaf6a4197b36f19d722b8a309b57e741fb02e311b1be  linux-4.9.211.tar.xz
+sha256 db5777d3a12a85bc8c130b7b250bab2283f9d964b725e5de3c216b495eeb31fe  linux-4.14.168.tar.xz
+sha256 8dbc21f994af9dc3468da4e934a641b457a57cf125d1a8e8f95fe488edd5b5ab  linux-4.19.99.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3328c37bb0..17d9ce928d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,10 +305,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.210"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.210"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.166"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.97"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.211"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.211"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.168"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.99"	if BR2_KERNEL_HEADERS_4_19
 	default "5.3.18"	if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
