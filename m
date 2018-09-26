From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Sep 2018 09:44:59 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 14,
 18}.x series
In-Reply-To: <1537965899-8253-1-git-send-email-festevam@gmail.com>
References: <1537965899-8253-1-git-send-email-festevam@gmail.com>
Message-ID: <1537965899-8253-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 9e37af4..0a913de 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 10604f7f8ccab5e7ce71f2e87d1410be679cd11c29c6c608ce35df1db40991de  linux-4.18.10.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
-sha256 76a4473dbcbd922c23a16130414829a36eb7e2f4e5859bd1b742fffdff907489  linux-4.14.71.tar.xz
-sha256 bdb76f48491a6aadc89c0f0f7fdc240d77cee54da5aac59da0b5d98e226b6f12  linux-4.9.128.tar.xz
-sha256 0010bc0aa64bc9cf55aaebd662dd0971f18284e925c74562ced31e0cf01d624d  linux-4.4.157.tar.xz
+sha256 df925906250bbc40fcf0137d7ad0fb8edc528d926832634f1233b7540564557f  linux-4.14.72.tar.xz
+sha256 6f5510d3fcfec1bf1e2d9c8e2fdcd7628c1886c6bdb29092adc5ccdf75e39318  linux-4.9.129.tar.xz
+sha256 571c8f6e8cabcc4e8c813869b87527f6e8e427b1c8fef96330c99743700f22a9  linux-4.4.158.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
 sha256 ad96d797571496c969aa71bf5d08e9d2a8c84458090d29a120f1b2981185a99e  linux-3.2.102.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 68b9ef1..99f2954 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -294,11 +294,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.157"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.128"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.71"	if BR2_KERNEL_HEADERS_4_14
+	default "4.4.158"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.129"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.72"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
-	default "4.18.9"	if BR2_KERNEL_HEADERS_4_18
+	default "4.18.10"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.7.4
