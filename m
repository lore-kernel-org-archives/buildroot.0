From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 22:11:04 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 18}.x series
Message-ID: <20181111211019.0A8A88260E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd0ca09e43be8bd87fa35c96fa099a338b85de36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ecb12d0b16..c782dc2aed 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.18.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.18.18" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.138-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 46f587ef6a..8c85b18cd1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 36c6d1360db9eab40270db6d292c259dd34d3dc06049d64afe3e4cfafb8562d3  linux-4.18.14.tar.xz
+sha256 34b361f815ad501268b6289dbb9b835dca1b1b470ad51cb8bc0f7c105588033d  linux-4.18.18.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
-sha256 ee3f19a4ff8a42793c193e361e1d34fcc821a5ca9b58db41befb2b4df0e482be  linux-4.14.76.tar.xz
-sha256 53730fc025ba330a6f4908a6a1e4cb86d821000c84167721680ccf1b37b26563  linux-4.9.133.tar.xz
-sha256 be0383d57c52a7ac6b1ca4d989a16a581f52ec9704ccf4ddf066b1b5b1313f87  linux-4.4.161.tar.xz
+sha256 9ddc7bc11cbea6475ac5abf18e01a143d7d506bece591e0dcb15c9452d3ed7d2  linux-4.14.80.tar.xz
+sha256 d39531e2df13cec1f998a5273d86f10db977409a778c0c7e56ef3d50c7262ec8  linux-4.9.136.tar.xz
+sha256 61b3d63a960a55046a7324d5724c262831952b223fe9ca02be0607f26d8f2ef4  linux-4.4.163.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
 sha256 ad96d797571496c969aa71bf5d08e9d2a8c84458090d29a120f1b2981185a99e  linux-3.2.102.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cdf639ab3a..93eb54f733 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -290,11 +290,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.161"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.133"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.76"	if BR2_KERNEL_HEADERS_4_14
+	default "4.4.163"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.136"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.80"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
-	default "4.18.14"	if BR2_KERNEL_HEADERS_4_18
+	default "4.18.18"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
