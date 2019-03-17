From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Mar 2019 22:43:47 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19, 20}.x series
Message-ID: <20190317214404.7E89B8EC07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6c2671db67745ad6ea63899fe382ee6844d71a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cbf1d861fadb491eee6e3686019d8f67d7f4ad85)
[Peter: drop 4.19.x/4.20.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 01ef93b994..1878d2e030 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 68ac319e0fb7edd6b6051541d9cf112cd4f77a29e16a69ae1e133ff51117f653  linux-4.18.20.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
-sha256 8ff98caed5b20b733dedcbe99559d71a0e09e239c0c2488b3fd799c96489eb0a  linux-4.14.99.tar.xz
-sha256 5eb1b9ba43370512ab637452089bb93f8c0fdd7d5399e99561d382f74517a816  linux-4.9.156.tar.xz
-sha256 be5211dd90142568199cd546c0893e1eb71c78774a11660a8bb8070bb9ebba39  linux-4.4.174.tar.xz
+sha256 7aa43e34e4c9e5965da29cef5ae196e06006f8c0d1d65fd755a2f197f0796a11  linux-4.14.103.tar.xz
+sha256 c09af067af62d299f5e33c279968de58c88fb7c59bd05e8f3bb460f611f60515  linux-4.9.160.tar.xz
+sha256 27da5401aa691762f3361c143f453877f499c02ea6c9c743b09538cb1af1c75d  linux-4.4.176.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
 sha256 ad96d797571496c969aa71bf5d08e9d2a8c84458090d29a120f1b2981185a99e  linux-3.2.102.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5571a8b63c..c89fcfc033 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -290,9 +290,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.174"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.156"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.99"	if BR2_KERNEL_HEADERS_4_14
+	default "4.4.176"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.160"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.103"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.18.20"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
