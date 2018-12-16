From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 15:37:47 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x series
Message-ID: <20181216144013.48E5B8B433@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f19dcd938d3332d4ba67dcdefc729623c5888327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 177a8a5fd966c09c237dc93cc8e131dbb5dfadd2)
[Peter: drop 4.19.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index d75ffd4217..2932aeba1b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
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
index aff3e38922..7d7b93b898 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -291,8 +291,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.166"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.142"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.85"	if BR2_KERNEL_HEADERS_4_14
+	default "4.9.143"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.86"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.18.20"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
