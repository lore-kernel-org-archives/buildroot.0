From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 21:06:58 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 7}.x series
Message-ID: <20200813190539.E76F28613E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24768450c41541fb4bad1ad1a9807b8676b06df5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 38f4587997585d21d0a235e1c512427412734572)
[Peter: drop 5.7.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index aaf8679430..0cd011f2f7 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  25504b4de7baf912071d1ed40b13af0689305442b9dea9218fd096d8bd997cf7  linux-5.6.16.tar.xz
 sha256  1448334371fb52f511255726832464d33877a210a7350260fb18eb225ae211eb  linux-5.5.19.tar.xz
-sha256  103f039f34a9009c42ea643b4f473bda6bb9607d5ad7f63b56b3e2351615fe2e  linux-5.4.45.tar.xz
+sha256  faa7b6f99220d5726f0eaee74a6394f0a3b89be1a75254f3804630211f3d6d21  linux-5.4.53.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  418299385195f09b27e371a35f305f3aff148e7557a341b53460091303aa9bb7  linux-4.4.226.tar.xz
-sha256  460a8c168fe5c60ce5b30015a4e4bf348d93a89f8b949de1f90779567ef345ca  linux-4.9.226.tar.xz
-sha256  4265afef56819b04656107a5abecde205c5bc5fb04b2e81447955e7e45db8085  linux-4.14.183.tar.xz
-sha256  82af886bc588b5c8d7474beb2bac13810ee3ed07da356a2553c81ae8e52e586f  linux-4.19.127.tar.xz
+sha256  e7f6c63c5a3921623f1c5df32a9cd61a93a76bc543dd7d91184a4714362cd7b0  linux-4.4.231.tar.xz
+sha256  4f843ba02fda5217942225afdce020d5f2f9b24f4210bf71a7c4fb63ceece8eb  linux-4.9.231.tar.xz
+sha256  a7e521457bc553848762c201d7ec5015b043c9dc447db2553eb193701634f9e1  linux-4.14.189.tar.xz
+sha256  7d7da84f65d31546911283c36478b548bc78c4139061a7a0241feca8318e3a6f  linux-4.19.134.tar.xz
 # Locally computed
 sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f11c2651e6..aa9f257a29 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -334,11 +334,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.226"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.226"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.183"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.127"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.45"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.231"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.231"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.189"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.134"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.53"	if BR2_KERNEL_HEADERS_5_4
 	default "5.5.19"	if BR2_KERNEL_HEADERS_5_5
 	default "5.6.16"	if BR2_KERNEL_HEADERS_5_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
