From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] fakeroot: remove all references to
	BR2_HOST_FAKEROOT
Message-ID: <20100409142128.4376820E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=77ab5443080dd994dd9dbe9c9eec302f83525dde
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/at91rm9200df_defconfig       |    1 -
 configs/at91rm9200df_ext_defconfig   |    1 -
 configs/at91sam9260dfc_defconfig     |    1 -
 configs/at91sam9260dfc_ext_defconfig |    1 -
 configs/at91sam9260pf_defconfig      |    1 -
 configs/at91sam9261ek_defconfig      |    1 -
 configs/at91sam9261ek_ext_defconfig  |    1 -
 configs/at91sam9263ek_defconfig      |    1 -
 configs/at91sam9263ek_ext_defconfig  |    1 -
 configs/at91sam9g20dfc_defconfig     |    1 -
 configs/at91sam9g20dfc_ext_defconfig |    1 -
 configs/atngw100-base_defconfig      |    1 -
 configs/atngw100_defconfig           |    1 -
 configs/atstk1005_defconfig          |    1 -
 configs/atstk100x_defconfig          |    1 -
 configs/i386_defconfig               |    1 -
 configs/i686_defconfig               |    1 -
 configs/integrator926_defconfig      |    1 -
 configs/integrator926_huge_defconfig |    1 -
 configs/kb9202_defconfig             |    1 -
 configs/v100sc2_defconfig            |    1 -
 scripts/test/Config.in.test.buildall |    1 -
 target/xtensa/defconfig              |    1 -
 23 files changed, 0 insertions(+), 23 deletions(-)

diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 3d98b0f..d5c5249 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -353,7 +353,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set
 BR2_PACKAGE_LIBINTL=y
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 1dea062..ca03b76 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -278,7 +278,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set
 BR2_PACKAGE_LIBINTL=y
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 1b4094e..2d8961c 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -365,7 +365,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set
 BR2_PACKAGE_LIBINTL=y
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 14bdc7a..ddd4b42 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -286,7 +286,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set
 BR2_PACKAGE_LIBINTL=y
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index de513a6..17477d2 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -275,7 +275,6 @@ BR2_PACKAGE_DISTCC=y
 BR2_PACKAGE_DMALLOC=y
 BR2_PACKAGE_EXPAT=y
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set
 BR2_PACKAGE_LIBINTL=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 9598085..824a503 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -359,7 +359,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set
 BR2_PACKAGE_LIBINTL=y
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index e7da95a..3ee047c 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -317,7 +317,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set
 BR2_PACKAGE_LIBINTL=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 145700d..8dff3e4 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -358,7 +358,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set
 BR2_PACKAGE_LIBINTL=y
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 15b4d3b..a84cc7a 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -279,7 +279,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set
 BR2_PACKAGE_LIBINTL=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index a6ef10c..3f7da32 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -358,7 +358,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set
 BR2_PACKAGE_LIBINTL=y
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 96d9793..84d703a 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -286,7 +286,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set
 BR2_PACKAGE_LIBINTL=y
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 6fbc0de..adae5c6 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -275,7 +275,6 @@ BR2_PACKAGE_BUSYBOX_SKELETON=y
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_GETTEXT is not set
 # BR2_PACKAGE_LIBINTL is not set
 # BR2_PACKAGE_LIBGMP is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 7a6cba4..0c76398 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -286,7 +286,6 @@ BR2_PACKAGE_BUSYBOX_SKELETON=y
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 BR2_PACKAGE_LIBINTL=y
 # BR2_PACKAGE_LIBGMP is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 309ac08..8044b38 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -297,7 +297,6 @@ BR2_PACKAGE_BUSYBOX_SKELETON=y
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 BR2_PACKAGE_LIBINTL=y
 # BR2_PACKAGE_LIBGMP is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index b4abff9..aac5aa8 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -297,7 +297,6 @@ BR2_PACKAGE_BZIP2=y
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 BR2_PACKAGE_LIBINTL=y
 # BR2_PACKAGE_LIBGMP is not set
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 97067c4..f4506f1 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -285,7 +285,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_GETTEXT is not set
 # BR2_PACKAGE_LIBINTL is not set
 # BR2_PACKAGE_LIBGMP is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index a3a2683..fc1f278 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -285,7 +285,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_GETTEXT is not set
 # BR2_PACKAGE_LIBINTL is not set
 # BR2_PACKAGE_LIBGMP is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 63bc68d..e985df4 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -282,7 +282,6 @@ BR2_PACKAGE_BUSYBOX_SKELETON=y
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_GETTEXT is not set
 # BR2_PACKAGE_LIBINTL is not set
 # BR2_PACKAGE_LIBGMP is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 357e143..b0d1dfe 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -286,7 +286,6 @@ BR2_PACKAGE_BISON=y
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 # BR2_PACKAGE_GETTEXT_STATIC is not set
 BR2_PACKAGE_LIBINTL=y
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 608eb86..3a0dfd6 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -286,7 +286,6 @@ BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_GETTEXT is not set
 # BR2_PACKAGE_LIBINTL is not set
 # BR2_PACKAGE_LIBGMP is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 336953e..3c2afa4 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -267,7 +267,6 @@ BR2_PACKAGE_BASH=y
 # BR2_PACKAGE_DISTCC is not set
 # BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
-BR2_HOST_FAKEROOT=y
 BR2_PACKAGE_GETTEXT=y
 BR2_PACKAGE_LIBINTL=y
 # BR2_PACKAGE_LIBGMP is not set
diff --git a/scripts/test/Config.in.test.buildall b/scripts/test/Config.in.test.buildall
index b5bb050..1acb466 100644
--- a/scripts/test/Config.in.test.buildall
+++ b/scripts/test/Config.in.test.buildall
@@ -29,7 +29,6 @@ config BR2_TARGET_TEST_PACKAGES
 	select BR2_PACKAGE_DISTCC
 	select BR2_PACKAGE_DMALLOC
 	select BR2_PACKAGE_FAKEROOT
-	select BR2_HOST_FAKEROOT
 	select BR2_PACKAGE_GETTEXT
 	select BR2_PACKAGE_GETTEXT_STATIC
 	select BR2_PACKAGE_LIBINTL
diff --git a/target/xtensa/defconfig b/target/xtensa/defconfig
index 07ab10b..f9b53a3 100644
--- a/target/xtensa/defconfig
+++ b/target/xtensa/defconfig
@@ -94,7 +94,6 @@ BR2_TOOLCHAIN_BUILDROOT=y
 #
 # Other development stuff
 #
-BR2_HOST_FAKEROOT=y
 # BR2_PACKAGE_LIBINTL is not set
 #  For NFS mount:
 BR2_PACKAGE_PORTMAP=y
-- 
1.6.3.3
