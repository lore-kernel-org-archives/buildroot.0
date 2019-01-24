From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 11:27:23 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/linux-headers:
 bump 4.{4, 9, 14, 19}.x series
Message-ID: <20190124102848.E35978E4AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81eba6d012c9057276b50425fa4d80f71991383e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5bbc4724633d1d6e04385ccd41db0b77252bdcf8)
[Peter: drop 4.19.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 2932aeba1b..80ec74e111 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 68ac319e0fb7edd6b6051541d9cf112cd4f77a29e16a69ae1e133ff51117f653  linux-4.18.20.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
-sha256 da9260a9022b917733201b89b5314847cb3332c31e70acb5e9b547956c266e28  linux-4.14.86.tar.xz
-sha256 0eb76464a696675fd4f8762e390328a377e973bfa263b00544ca1b5b10ac2cbf  linux-4.9.143.tar.xz
-sha256 bf10effd995aa183b553cedd764c577137a9f97dc8709e2e1c04b1e0f4e6415a  linux-4.4.166.tar.xz
+sha256 6a587c8b4160918efa082b0c2eda8c2db0f50d8814ad1d1ac94be1edf66ca6a9  linux-4.14.91.tar.xz
+sha256 6067151b0225a8de1ab79abc9be7bae237eaca0cd838eb26684169560d88a994  linux-4.9.148.tar.xz
+sha256 06f1b080332251628727e42d21b4530035f03f00d75432199b2548172b1650a9  linux-4.4.169.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
 sha256 ad96d797571496c969aa71bf5d08e9d2a8c84458090d29a120f1b2981185a99e  linux-3.2.102.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7d7b93b898..f9117d34da 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -290,9 +290,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.166"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.143"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.86"	if BR2_KERNEL_HEADERS_4_14
+	default "4.4.169"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.148"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.91"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.18.20"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
