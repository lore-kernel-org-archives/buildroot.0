From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jan 2019 08:49:50 +0100
Subject: [Buildroot] [git commit] package/linux-headers: bump 4.{4, 9, 14,
 19}.x series
Message-ID: <20190102074531.8B06A811FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bbc4724633d1d6e04385ccd41db0b77252bdcf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index adc133495c..3e7fdbc81f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 ad0823183522e743972382df0aa08fb5ae3077f662b125f1e599b0b2aaa12438  linux-4.20.tar.xz
-sha256 84d7aa436e10690b53165b9d59ec20548e6a4ce3324b135c5019fb0f7dd2a2d2  linux-4.19.7.tar.xz
+sha256 f50a77fc40e13fc406791346fa91926394205874cd50246c7c2374006bacc0c2  linux-4.19.13.tar.xz
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
index 3c43bc8536..32ddcef5f9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -306,12 +306,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
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
-	default "4.19.7"	if BR2_KERNEL_HEADERS_4_19
+	default "4.19.13"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20"		if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
