From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 11:00:31 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 18}.x series
Message-ID: <20181124095731.D0CF588023@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0021a2a49f68a1405a8ba132dc9466c771ffc46e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c782dc2aed..85e540754a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.18.18" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.18.20" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.138-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 8c85b18cd1..12da19e043 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 34b361f815ad501268b6289dbb9b835dca1b1b470ad51cb8bc0f7c105588033d  linux-4.18.18.tar.xz
+sha256 68ac319e0fb7edd6b6051541d9cf112cd4f77a29e16a69ae1e133ff51117f653  linux-4.18.20.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
-sha256 9ddc7bc11cbea6475ac5abf18e01a143d7d506bece591e0dcb15c9452d3ed7d2  linux-4.14.80.tar.xz
-sha256 d39531e2df13cec1f998a5273d86f10db977409a778c0c7e56ef3d50c7262ec8  linux-4.9.136.tar.xz
-sha256 61b3d63a960a55046a7324d5724c262831952b223fe9ca02be0607f26d8f2ef4  linux-4.4.163.tar.xz
+sha256 701728de924e0ec4a6b7cf59252011f8268a1b70aaf02b8487c1b2190feb3f20  linux-4.14.83.tar.xz
+sha256 f888aef58c2c4d82c81511ad6a4528ee9a8241bb96c05c65e71224988782f943  linux-4.9.140.tar.xz
+sha256 9bb4a1757e67dbd0923dbdf7e7e0baa9baa53ac942471d8fbb8d35dd5b313c10  linux-4.4.164.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
 sha256 ad96d797571496c969aa71bf5d08e9d2a8c84458090d29a120f1b2981185a99e  linux-3.2.102.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 93eb54f733..756fe81a57 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -290,11 +290,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.163"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.136"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.80"	if BR2_KERNEL_HEADERS_4_14
+	default "4.4.164"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.140"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.83"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
-	default "4.18.18"	if BR2_KERNEL_HEADERS_4_18
+	default "4.18.20"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
