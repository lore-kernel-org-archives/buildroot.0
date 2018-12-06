From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  6 Dec 2018 21:01:29 +0100
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
 19}.x series
Message-ID: <20181206200129.21254-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d8492ed92a..5c074d3d98 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.154-cip28" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index f67ff67d7a..693605d3ec 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 644e61beb66211c0c5c13f91d96de1725055e6eea4cda7bb37ce9929ba8f09c3  linux-4.19.6.tar.xz
+sha256 84d7aa436e10690b53165b9d59ec20548e6a4ce3324b135c5019fb0f7dd2a2d2  linux-4.19.7.tar.xz
 sha256 68ac319e0fb7edd6b6051541d9cf112cd4f77a29e16a69ae1e133ff51117f653  linux-4.18.20.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
-sha256 e41914f413dba0fa19bd4e68534e25e513b619372cc9e7da0889b38c1c6fefce  linux-4.14.85.tar.xz
-sha256 344a7edafbf79fa5aabe1e11b16ffa56cda3a084151cf621fabe23771fd8c406  linux-4.9.142.tar.xz
+sha256 da9260a9022b917733201b89b5314847cb3332c31e70acb5e9b547956c266e28  linux-4.14.86.tar.xz
+sha256 0eb76464a696675fd4f8762e390328a377e973bfa263b00544ca1b5b10ac2cbf  linux-4.9.143.tar.xz
 sha256 bf10effd995aa183b553cedd764c577137a9f97dc8709e2e1c04b1e0f4e6415a  linux-4.4.166.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c8d5f1964b..3221e41c46 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -299,11 +299,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.166"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.142"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.85"	if BR2_KERNEL_HEADERS_4_14
+	default "4.9.143"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.86"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.18.20"	if BR2_KERNEL_HEADERS_4_18
-	default "4.19.6"	if BR2_KERNEL_HEADERS_4_19
+	default "4.19.7"	if BR2_KERNEL_HEADERS_4_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.11.0
