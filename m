From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 6 May 2010 16:22:21 -0500
Subject: [Buildroot] [PATCH] cleanup defconfig's due to removal of -mm
	options
In-Reply-To: <0D753D10438DA54287A00B02708426976368AC7578@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B02708426976368AC7578@AUSP01VMBX24.collaborationhost.net>
Message-ID: <0D753D10438DA54287A00B0270842697636ECB5326@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update defconfigs due to removal of the MM_PATCH options in
commit 12ebf5714c58cecdb19dbd9266ace5e9380562b0.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 7d2bcfd..e320216 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -959,8 +959,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -986,8 +984,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 79e55fc..85202cc 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -885,8 +885,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -912,8 +910,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 087067f..d499352 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -974,8 +974,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -1001,8 +999,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index e52cd2d..e83e5dd 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -894,8 +894,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -921,8 +919,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index cd7483b..84d3c76 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -1025,8 +1025,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -1052,8 +1050,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 5ab47ad..24d40e1 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -982,8 +982,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -1009,8 +1007,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index bc95b6b..f0e369f 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -1022,8 +1022,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -1049,8 +1047,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 9771c83..ae656de 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -944,8 +944,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -971,8 +969,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 30cc4e1..5c3ed53 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -889,8 +889,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -916,8 +914,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index e18754e..6ee0069 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -893,8 +893,6 @@ BR2_KERNEL_PATCH_LEVEL="$(BR2_KERNEL_MINORLEVEL)"
 BR2_KERNEL_NEXT_VERSION="2.6.29"
 BR2_KERNEL_THIS_VERSION="2.6.28"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_28=y
@@ -920,8 +918,6 @@ BR2_KERNEL_ADD_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index d3092df..97d7e23 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -772,8 +772,6 @@ BR2_KERNEL_LATEST_2_6_21="7"
 BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_THIS_VERSION="2.6.29"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_29=y
 # BR2_LINUX_2_6_28 is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 995aee1..6b95ba6 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -785,8 +785,6 @@ BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_PATCH_LEVEL="2"
 BR2_KERNEL_THIS_VERSION="2.6.29"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_29=y
@@ -812,8 +810,6 @@ BR2_KERNEL_ADD_LATEST_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 # BR2_KERNEL_ARCH_PATCH_ENABLED is not set
 BR2_LINUX_BSP_PATCH=""
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index a1fe0b7..e205eb1 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -805,8 +805,6 @@ BR2_KERNEL_PATCH_LEVEL="13"
 BR2_KERNEL_NEXT_VERSION="2.6.28"
 BR2_KERNEL_THIS_VERSION="2.6.27"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 # BR2_LINUX_2_6_28 is not set
@@ -832,8 +830,6 @@ BR2_KERNEL_ADD_LATEST_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
 # BR2_ARCH_AVR32_2_6_28_2 is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 0fbbf14..818e5b4 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -902,8 +902,6 @@ BR2_KERNEL_PATCH_LEVEL="13"
 BR2_KERNEL_NEXT_VERSION="2.6.28"
 BR2_KERNEL_THIS_VERSION="2.6.27"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
 # BR2_LINUX_2_6_28 is not set
@@ -929,8 +927,6 @@ BR2_KERNEL_ADD_LATEST_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
 # BR2_ARCH_AVR32_2_6_28_2 is not set
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 2481412..5f7b401 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -731,8 +731,6 @@ BR2_KERNEL_LATEST_2_6_22="19"
 BR2_KERNEL_LATEST_2_6_21="7"
 BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_LINUX_2_6_STABLE=y
 # BR2_LINUX_2_6_29 is not set
 # BR2_LINUX_2_6_28 is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 066842f..7aac68e 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -731,8 +731,6 @@ BR2_KERNEL_LATEST_2_6_22="19"
 BR2_KERNEL_LATEST_2_6_21="7"
 BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_LINUX_2_6_STABLE=y
 # BR2_LINUX_2_6_29 is not set
 # BR2_LINUX_2_6_28 is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 3879272..e4bff82 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -737,8 +737,6 @@ BR2_KERNEL_LATEST_2_6_22="19"
 BR2_KERNEL_LATEST_2_6_21="7"
 BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_LINUX_2_6_STABLE=y
 # BR2_LINUX_2_6_28 is not set
 # BR2_LINUX_2_6_27 is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 86443db..8c219b4 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -713,8 +713,6 @@ BR2_KERNEL_LATEST_2_6_22="19"
 BR2_KERNEL_LATEST_2_6_21="7"
 BR2_KERNEL_LATEST_2_6_20="21"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_LINUX_2_6_STABLE=y
 # BR2_LINUX_2_6_28 is not set
 # BR2_LINUX_2_6_27 is not set
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 4c84b9e..d24e7a3 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -688,8 +688,6 @@ BR2_KERNEL_CURRENT_VERSION="2.6.24.4"
 BR2_KERNEL_NEXT_VERSION="2.6.25"
 BR2_KERNEL_THIS_VERSION="2.6.24"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 # BR2_LINUX_2_6_STABLE is not set
 BR2_LINUX_2_6_24=y
 # BR2_LINUX_2_6_23 is not set
