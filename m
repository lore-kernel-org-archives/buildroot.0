From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Dec 2018 08:36:31 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x series
Message-ID: <20181211073839.C995186345@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d1f12fb5fd2ec8302bb0eaf49752258ef576a0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 85d00b3c8eaec4fc9b9a754246f4e6db151321b8)
[Peter: drop 4.19.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 12da19e043..d75ffd4217 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 68ac319e0fb7edd6b6051541d9cf112cd4f77a29e16a69ae1e133ff51117f653  linux-4.18.20.tar.xz
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
index 756fe81a57..aff3e38922 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -290,9 +290,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
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
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
