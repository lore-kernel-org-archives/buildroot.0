From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 22:50:26 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19, 20}.x series
Message-ID: <20190129215129.4CF1481975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e647731c8bd934339b7867c0841a92f354b92ffc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c331187744a91571d8be20e7fff870a3fc062db0)
[Peter: drop 4.19.x/4.20.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 7612290853..58fc45065f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 68ac319e0fb7edd6b6051541d9cf112cd4f77a29e16a69ae1e133ff51117f653  linux-4.18.20.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
-sha256 ce6729e3fca312520e3cb4f27993852dbb019d94c59c0b35cedab571f9cb58e4  linux-4.14.95.tar.xz
-sha256 90e47b85c09af47eefafe851685ee731538f640b0650a6a9cfa0234436708e39  linux-4.9.152.tar.xz
-sha256 fd4074da2a946368292b04c44241de37f6b30a10f4231673d0689cf6454fefa0  linux-4.4.171.tar.xz
+sha256 110daeae1a416b7e0ec8dce5e86d67552deeb4567f696c3869389be239f0ecb5  linux-4.14.96.tar.xz
+sha256 9066929ec2550794ae107350a5f3c5b648438aa915cfc62bac5b7a54b9d7731a  linux-4.9.153.tar.xz
+sha256 fb4d16b3c1e508dfa0344e406caeb25286d1c258421d8891b5580323e4e639fb  linux-4.4.172.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
 sha256 ad96d797571496c969aa71bf5d08e9d2a8c84458090d29a120f1b2981185a99e  linux-3.2.102.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 79bf78f2e9..ce093832c7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -290,9 +290,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.171"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.152"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.95"	if BR2_KERNEL_HEADERS_4_14
+	default "4.4.172"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.153"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.96"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.18.20"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
