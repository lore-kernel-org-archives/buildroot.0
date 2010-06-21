From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jun 2010 23:07:12 +0200
Subject: [Buildroot] [git commit master 1/1] Config.in.mirrors: Use
	sources.buildroot.net as default backup site
Message-ID: <20100621210812.A1B41817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e9220ad60bd3c23b9736fc9728d14c9680ac6ff2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The buildroot/busybox/uClibc VM is running low on disk space, and we've
been asked to move the source mirrors off-site.

A redirect has been setup between the old buildroot.net/downloads/sources/
and sources.buildroot.net, so old .configs continue to work, but we might
as well use the official one now.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/arm_toolchain_defconfig           |    2 +-
 configs/at91rm9200df_defconfig            |    2 +-
 configs/at91rm9200df_ext_bare_defconfig   |    2 +-
 configs/at91rm9200df_ext_defconfig        |    2 +-
 configs/at91sam9260dfc_defconfig          |    2 +-
 configs/at91sam9260dfc_ext_bare_defconfig |    2 +-
 configs/at91sam9260dfc_ext_defconfig      |    2 +-
 configs/at91sam9261ek_defconfig           |    2 +-
 configs/at91sam9261ek_ext_bare_defconfig  |    2 +-
 configs/at91sam9261ek_ext_defconfig       |    2 +-
 configs/at91sam9263ek_defconfig           |    2 +-
 configs/at91sam9263ek_ext_bare_defconfig  |    2 +-
 configs/at91sam9263ek_ext_defconfig       |    2 +-
 configs/at91sam9g20dfc_defconfig          |    2 +-
 configs/at91sam9g20dfc_ext_bare_defconfig |    2 +-
 configs/at91sam9g20dfc_ext_defconfig      |    2 +-
 configs/atngw100-base_defconfig           |    2 +-
 configs/atngw100_defconfig                |    2 +-
 configs/atstk1005_defconfig               |    2 +-
 configs/atstk100x_defconfig               |    2 +-
 configs/i386_defconfig                    |    2 +-
 configs/i686_defconfig                    |    2 +-
 configs/integrator926_defconfig           |    2 +-
 configs/integrator926_huge_defconfig      |    2 +-
 target/device/Config.in.mirrors           |    2 +-
 25 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index e4c181e..2fc6744 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -145,7 +145,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index afa0aaf..18fdf69 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -150,7 +150,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 436c8ff..b7e4c51 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -145,7 +145,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index d549eac..bfe5bf2 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -156,7 +156,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 3865f6a..89b5ed4 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -163,7 +163,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index 92704d9..d5c8837 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -145,7 +145,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 46218a0..dcc086c 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -164,7 +164,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 2f0bd52..2c3894b 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -166,7 +166,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index b687190..56b1357 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -148,7 +148,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index afb5fbe..1046cbc 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -167,7 +167,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 22c4c0c..bd63da5 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -164,7 +164,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 4ec46b3..d9ffae6 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -147,7 +147,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index f93b10a..2a57166 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -166,7 +166,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 3b53329..e03e7a2 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -164,7 +164,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 75f65ea..c2f60bb 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -145,7 +145,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 053a9aa..82b7960 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -164,7 +164,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 4b5b633..1c0a058 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -98,7 +98,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 0c22b90..8003c4c 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -86,7 +86,7 @@ BR2_STAGING_DIR="$(BASE_DIR)/staging"
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 213157b..54f6e11 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -96,7 +96,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index bbdf26f..859794b 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -97,7 +97,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 2481412..82b77c3 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -98,7 +98,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 066842f..5aa20c4 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -98,7 +98,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 2c11692..067dab0 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -94,7 +94,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="switch"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 4aacbcb..e0c1873 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -94,7 +94,7 @@ BR2_COPYTO=""
 # Mirrors and Download locations
 #
 BR2_PRIMARY_SITE=""
-BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
 BR2_SOURCEFORGE_MIRROR="switch"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
diff --git a/target/device/Config.in.mirrors b/target/device/Config.in.mirrors
index ec82bfb..1af982d 100644
--- a/target/device/Config.in.mirrors
+++ b/target/device/Config.in.mirrors
@@ -11,7 +11,7 @@ config BR2_PRIMARY_SITE
 
 config BR2_BACKUP_SITE
 	string "Backup download site"
-	default "http://buildroot.net/downloads/sources/"
+	default "http://sources.buildroot.net/"
 	help
 	  Backup site to download from. If this option is set then buildroot
 	  will fall back to download package sources from here if the
-- 
1.7.1
