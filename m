From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 13:28:58 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x series
Message-ID: <20181203122533.938FF8A4E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85d00b3c8eaec4fc9b9a754246f4e6db151321b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 74f4321e43..d8492ed92a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.154-cip28" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 8148315c06..f67ff67d7a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
+sha256 644e61beb66211c0c5c13f91d96de1725055e6eea4cda7bb37ce9929ba8f09c3  linux-4.19.6.tar.xz
 sha256 68ac319e0fb7edd6b6051541d9cf112cd4f77a29e16a69ae1e133ff51117f653  linux-4.18.20.tar.xz
-sha256 c10c7f81019bd782ea77a25725f6d53e9affa4a0cfd3985c161f3a2a22f2df73  linux-4.19.2.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
-sha256 701728de924e0ec4a6b7cf59252011f8268a1b70aaf02b8487c1b2190feb3f20  linux-4.14.83.tar.xz
-sha256 f888aef58c2c4d82c81511ad6a4528ee9a8241bb96c05c65e71224988782f943  linux-4.9.140.tar.xz
-sha256 9bb4a1757e67dbd0923dbdf7e7e0baa9baa53ac942471d8fbb8d35dd5b313c10  linux-4.4.164.tar.xz
+sha256 e41914f413dba0fa19bd4e68534e25e513b619372cc9e7da0889b38c1c6fefce  linux-4.14.85.tar.xz
+sha256 344a7edafbf79fa5aabe1e11b16ffa56cda3a084151cf621fabe23771fd8c406  linux-4.9.142.tar.xz
+sha256 bf10effd995aa183b553cedd764c577137a9f97dc8709e2e1c04b1e0f4e6415a  linux-4.4.166.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
 sha256 ad96d797571496c969aa71bf5d08e9d2a8c84458090d29a120f1b2981185a99e  linux-3.2.102.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1b2a585280..c8d5f1964b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -298,12 +298,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.164"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.140"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.83"	if BR2_KERNEL_HEADERS_4_14
+	default "4.4.166"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.142"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.85"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.18.20"	if BR2_KERNEL_HEADERS_4_18
-	default "4.19.2"	if BR2_KERNEL_HEADERS_4_19
+	default "4.19.6"	if BR2_KERNEL_HEADERS_4_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
