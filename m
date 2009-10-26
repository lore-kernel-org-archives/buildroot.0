From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Oct 2009 21:41:11 +0100
Subject: [Buildroot] [git commit master] lzma: remove 'target' from lzma
	package name
Message-ID: <20091026204432.A5B90777B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=89dadc81ecf737eba5f438da529c2f81712ec15a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We normally don't do this, and it makes using Makefile.autotools.in harder.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/arm_toolchain_defconfig           |    2 +-
 configs/at91rm9200df_defconfig            |    2 +-
 configs/at91rm9200df_ext_bare_defconfig   |    2 +-
 configs/at91rm9200df_ext_defconfig        |    2 +-
 configs/at91sam9260dfc_defconfig          |    2 +-
 configs/at91sam9260dfc_ext_bare_defconfig |    2 +-
 configs/at91sam9260dfc_ext_defconfig      |    2 +-
 configs/at91sam9260pf_defconfig           |    4 ++--
 configs/at91sam9261ek_defconfig           |    4 ++--
 configs/at91sam9261ek_ext_bare_defconfig  |    2 +-
 configs/at91sam9261ek_ext_defconfig       |    4 ++--
 configs/at91sam9263ek_defconfig           |    4 ++--
 configs/at91sam9263ek_ext_bare_defconfig  |    2 +-
 configs/at91sam9263ek_ext_defconfig       |    4 ++--
 configs/at91sam9g20dfc_defconfig          |    2 +-
 configs/at91sam9g20dfc_ext_bare_defconfig |    2 +-
 configs/at91sam9g20dfc_ext_defconfig      |    2 +-
 configs/atngw100_defconfig                |    2 +-
 configs/atstk1005_defconfig               |    2 +-
 configs/atstk100x_defconfig               |    2 +-
 configs/i386_defconfig                    |    2 +-
 configs/i686_defconfig                    |    2 +-
 configs/integrator926_defconfig           |    2 +-
 configs/integrator926_huge_defconfig      |    4 ++--
 configs/kb9202_defconfig                  |    2 +-
 configs/v100sc2_defconfig                 |    2 +-
 package/lzma/Config.in                    |    7 ++++---
 package/lzma/lzma.mk                      |    6 +++---
 scripts/buildall.sh                       |    2 +-
 scripts/test/Config.in.test.buildall      |    2 +-
 30 files changed, 41 insertions(+), 40 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 1c59ae5..6c903d0 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -680,7 +680,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # BR2_PACKAGE_GZIP is not set
 # BR2_PACKAGE_LZO is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 # BR2_PACKAGE_ZLIB is not set
 
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 81ebc8e..aba4d0d 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -788,7 +788,7 @@ BR2_PACKAGE_LIBGLIB2=y
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 48b7eb5..463f556 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -600,7 +600,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # BR2_PACKAGE_GZIP is not set
 # BR2_PACKAGE_LZO is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 # BR2_PACKAGE_ZLIB is not set
 
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 078956f..4c8d50d 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -713,7 +713,7 @@ BR2_PACKAGE_LIBGLIB2=y
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 4eb59fe..056a661 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -802,7 +802,7 @@ BR2_PACKAGE_LIBGLIB2=y
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index 6620faf..1048d9c 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -600,7 +600,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # BR2_PACKAGE_GZIP is not set
 # BR2_PACKAGE_LZO is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 # BR2_PACKAGE_ZLIB is not set
 
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 6d1a281..3436849 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -721,7 +721,7 @@ BR2_PACKAGE_LIBGLIB2=y
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index 3cf6324..2cdabd0 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -533,8 +533,8 @@ BR2_PACKAGE_TSLIB=y
 BR2_COMPRESSOR_SUPPORT=y
 BR2_PACKAGE_GZIP=y
 BR2_PACKAGE_LZO=y
-BR2_PACKAGE_LZMA_TARGET=y
-# BR2_PACKAGE_LZMA_TARGET_HEADERS is not set
+BR2_PACKAGE_LZMA=y
+# BR2_PACKAGE_LZMA_HEADERS is not set
 BR2_PACKAGE_LZMA_HOST=y
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index eb0732f..2af89ac 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -817,8 +817,8 @@ BR2_PACKAGE_TSLIB=y
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
-BR2_PACKAGE_LZMA_TARGET=y
-# BR2_PACKAGE_LZMA_TARGET_HEADERS is not set
+BR2_PACKAGE_LZMA=y
+# BR2_PACKAGE_LZMA_HEADERS is not set
 BR2_PACKAGE_LZMA_HOST=y
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 03c2acb..7c11189 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -603,7 +603,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # BR2_PACKAGE_GZIP is not set
 # BR2_PACKAGE_LZO is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 # BR2_PACKAGE_ZLIB is not set
 
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 6cdd8e9..e233b94 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -773,8 +773,8 @@ BR2_PACKAGE_TSLIB=y
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
-BR2_PACKAGE_LZMA_TARGET=y
-# BR2_PACKAGE_LZMA_TARGET_HEADERS is not set
+BR2_PACKAGE_LZMA=y
+# BR2_PACKAGE_LZMA_HEADERS is not set
 BR2_PACKAGE_LZMA_HOST=y
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 62a2698..d7645d9 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -814,8 +814,8 @@ BR2_PACKAGE_TSLIB=y
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
-BR2_PACKAGE_LZMA_TARGET=y
-# BR2_PACKAGE_LZMA_TARGET_HEADERS is not set
+BR2_PACKAGE_LZMA=y
+# BR2_PACKAGE_LZMA_HEADERS is not set
 BR2_PACKAGE_LZMA_HOST=y
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 7ba1eed..d31b8de 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -602,7 +602,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # BR2_PACKAGE_GZIP is not set
 # BR2_PACKAGE_LZO is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 # BR2_PACKAGE_ZLIB is not set
 
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 99cf3c5..bda2149 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -735,8 +735,8 @@ BR2_PACKAGE_TSLIB=y
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
-BR2_PACKAGE_LZMA_TARGET=y
-# BR2_PACKAGE_LZMA_TARGET_HEADERS is not set
+BR2_PACKAGE_LZMA=y
+# BR2_PACKAGE_LZMA_HEADERS is not set
 BR2_PACKAGE_LZMA_HOST=y
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 51e2b83..ed271d8 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -736,7 +736,7 @@ BR2_PACKAGE_XSERVER_none=y
 # Compressors / decompressors
 #
 # BR2_PACKAGE_LZO is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 63e166d..0b778eb 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -600,7 +600,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 # BR2_PACKAGE_GZIP is not set
 # BR2_PACKAGE_LZO is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 # BR2_PACKAGE_ZLIB is not set
 
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index d674160..5f5dbe2 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -721,7 +721,7 @@ BR2_PACKAGE_LIBGLIB2=y
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 952028d..5f05009 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -665,7 +665,7 @@ BR2_PACKAGE_LIBGLIB2=y
 #
 BR2_PACKAGE_LZO=y
 # BR2_PACKAGE_LZOP is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 55e23f6..5241859 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -707,7 +707,7 @@ BR2_PACKAGE_LIBGLIB2=y
 # Compressors / decompressors
 #
 BR2_PACKAGE_LZO=y
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 4a47d0d..c8fb4e4 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -810,7 +810,7 @@ BR2_PACKAGE_LIBGLIB2=y
 # BR2_PACKAGE_GZIP is not set
 BR2_PACKAGE_LZO=y
 # BR2_PACKAGE_LZOP is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index afc1075..0dec12e 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -642,7 +642,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 BR2_PACKAGE_LZO=y
 # BR2_PACKAGE_LZOP is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 1e1da21..90dce72 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -642,7 +642,7 @@ BR2_PACKAGE_XSERVER_none=y
 #
 BR2_PACKAGE_LZO=y
 # BR2_PACKAGE_LZOP is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index a53d8c3..68b0ff6 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -640,7 +640,7 @@ BR2_PACKAGE_XSERVER_none=y
 # Compressors / decompressors
 #
 # BR2_PACKAGE_LZO is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index b379e9f..69f16de 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -616,8 +616,8 @@ BR2_PACKAGE_XSERVER_none=y
 # Compressors / decompressors
 #
 # BR2_PACKAGE_LZO is not set
-BR2_PACKAGE_LZMA_TARGET=y
-# BR2_PACKAGE_LZMA_TARGET_HEADERS is not set
+BR2_PACKAGE_LZMA=y
+# BR2_PACKAGE_LZMA_HEADERS is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index b8ca087..d41b30b 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -632,7 +632,7 @@ BR2_X11_PREFIX="/usr"
 BR2_COMPRESSOR_SUPPORT=y
 # BR2_PACKAGE_GZIP is not set
 # BR2_PACKAGE_LZO is not set
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 # BR2_PACKAGE_ZLIB is not set
 BR2_SCRIPTING_SUPPORT=y
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 61e4c8a..e198353 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -653,7 +653,7 @@ BR2_PACKAGE_LIBGLIB2=y
 BR2_COMPRESSOR_SUPPORT=y
 # BR2_PACKAGE_GZIP is not set
 BR2_PACKAGE_LZO=y
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 # BR2_PACKAGE_LZMA_HOST is not set
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
diff --git a/package/lzma/Config.in b/package/lzma/Config.in
index 76c95af..ab1ea59 100644
--- a/package/lzma/Config.in
+++ b/package/lzma/Config.in
@@ -1,8 +1,9 @@
-config BR2_PACKAGE_LZMA_TARGET
-	bool "Install lzma for the target system"
+config BR2_PACKAGE_LZMA
+	bool "lzma"
 	depends on BR2_GCC_CROSS_CXX
 	help
-	  lzma utils on the target
+	  Lempel Ziv compression method (LZMA) is a compression
+	  algorithm with high compression ratio.
 
 	  http://tukaani.org/lzma/
 
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index ff516fe..7cb432b 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -113,7 +113,7 @@ $(TARGET_DIR)/$(LZMA_TARGET_BINARY): $(LZMA_TARGET_DIR)/src/lzma/lzma
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	touch -c $@
 
-lzma-target: $(TARGET_DIR)/$(LZMA_TARGET_BINARY)
+lzma: $(TARGET_DIR)/$(LZMA_TARGET_BINARY)
 
 lzma-source: $(DL_DIR)/$(LZMA_SOURCE)
 
@@ -129,6 +129,6 @@ lzma-dirclean:
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(BR2_PACKAGE_LZMA_TARGET),y)
-TARGETS+=lzma-target
+ifeq ($(BR2_PACKAGE_LZMA),y)
+TARGETS+=lzma
 endif
diff --git a/scripts/buildall.sh b/scripts/buildall.sh
index 47322c7..e06ee38 100755
--- a/scripts/buildall.sh
+++ b/scripts/buildall.sh
@@ -325,7 +325,7 @@ EXE	mk	xvkbd
 RESTART
 comment	Compressors / decompressors
 EXE	mk	lzo				OK	
-EXE	mk	lzma-target			OK	
+EXE	mk	lzma				OK	
 EXE	mk	zlib				OK	
 comment	Package managers
 EXE	mk	ipkg				OK	
diff --git a/scripts/test/Config.in.test.buildall b/scripts/test/Config.in.test.buildall
index cc9f6a4..84c4de1 100644
--- a/scripts/test/Config.in.test.buildall
+++ b/scripts/test/Config.in.test.buildall
@@ -599,7 +599,7 @@ config BR2_TARGET_TEST_PACKAGES
 # Compressors / decompressors
 #
 	select BR2_PACKAGE_LZO
-# BR2_PACKAGE_LZMA_TARGET is not set
+# BR2_PACKAGE_LZMA is not set
 	select BR2_PACKAGE_LZMA_HOST
 	select BR2_PACKAGE_ZLIB
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
-- 
1.6.3.3
