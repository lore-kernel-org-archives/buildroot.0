From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 11:15:27 +0100
Subject: [Buildroot] [git commit] x11r7/xfont_*: add missing select
	BR2_PACKAGE_XFONT_FONT_UTIL
Message-ID: <20151230101615.A82E682722@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9da584ea2b3319f8f36eb2b3380fb976f6a13572
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/d63/d63b45c24d01bfb3409e90569a0708f1d4af905d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xfont_font-adobe-100dpi/Config.in               | 1 +
 package/x11r7/xfont_font-adobe-75dpi/Config.in                | 1 +
 package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in        | 1 +
 package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in         | 1 +
 package/x11r7/xfont_font-adobe-utopia-type1/Config.in         | 1 +
 package/x11r7/xfont_font-alias/Config.in                      | 1 +
 package/x11r7/xfont_font-arabic-misc/Config.in                | 1 +
 package/x11r7/xfont_font-bh-100dpi/Config.in                  | 1 +
 package/x11r7/xfont_font-bh-75dpi/Config.in                   | 1 +
 package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in | 1 +
 package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in  | 1 +
 package/x11r7/xfont_font-bh-ttf/Config.in                     | 1 +
 package/x11r7/xfont_font-bh-type1/Config.in                   | 1 +
 package/x11r7/xfont_font-bitstream-100dpi/Config.in           | 1 +
 package/x11r7/xfont_font-bitstream-75dpi/Config.in            | 1 +
 package/x11r7/xfont_font-bitstream-type1/Config.in            | 1 +
 package/x11r7/xfont_font-cronyx-cyrillic/Config.in            | 1 +
 package/x11r7/xfont_font-cursor-misc/Config.in                | 1 +
 package/x11r7/xfont_font-daewoo-misc/Config.in                | 1 +
 package/x11r7/xfont_font-dec-misc/Config.in                   | 1 +
 package/x11r7/xfont_font-ibm-type1/Config.in                  | 1 +
 package/x11r7/xfont_font-isas-misc/Config.in                  | 1 +
 package/x11r7/xfont_font-jis-misc/Config.in                   | 1 +
 package/x11r7/xfont_font-micro-misc/Config.in                 | 1 +
 package/x11r7/xfont_font-misc-cyrillic/Config.in              | 1 +
 package/x11r7/xfont_font-misc-ethiopic/Config.in              | 1 +
 package/x11r7/xfont_font-misc-meltho/Config.in                | 1 +
 package/x11r7/xfont_font-misc-misc/Config.in                  | 1 +
 package/x11r7/xfont_font-mutt-misc/Config.in                  | 1 +
 package/x11r7/xfont_font-schumacher-misc/Config.in            | 1 +
 package/x11r7/xfont_font-screen-cyrillic/Config.in            | 1 +
 package/x11r7/xfont_font-sony-misc/Config.in                  | 1 +
 package/x11r7/xfont_font-sun-misc/Config.in                   | 1 +
 package/x11r7/xfont_font-winitzki-cyrillic/Config.in          | 1 +
 package/x11r7/xfont_font-xfree86-type1/Config.in              | 1 +
 35 files changed, 35 insertions(+)

diff --git a/package/x11r7/xfont_font-adobe-100dpi/Config.in b/package/x11r7/xfont_font-adobe-100dpi/Config.in
index aaac639..766c06e 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-100dpi/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_100DPI
 	bool "font-adobe-100dpi"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-75dpi/Config.in b/package/x11r7/xfont_font-adobe-75dpi/Config.in
index f1c0a41..1d79f41 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-75dpi/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_75DPI
 	bool "font-adobe-75dpi"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in b/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
index 02f2aeb..a31ee5d 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_100DPI
 	bool "font-adobe-utopia-100dpi"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in b/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
index 4a6e29c..2279723 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_75DPI
 	bool "font-adobe-utopia-75dpi"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/Config.in b/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
index d1efb70..60b631e 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_TYPE1
 	bool "font-adobe-utopia-type1"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-alias/Config.in b/package/x11r7/xfont_font-alias/Config.in
index b655160..b30e222 100644
--- a/package/x11r7/xfont_font-alias/Config.in
+++ b/package/x11r7/xfont_font-alias/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ALIAS
 	bool "font-alias"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-arabic-misc/Config.in b/package/x11r7/xfont_font-arabic-misc/Config.in
index acbdf7c..1ec5090 100644
--- a/package/x11r7/xfont_font-arabic-misc/Config.in
+++ b/package/x11r7/xfont_font-arabic-misc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ARABIC_MISC
 	bool "font-arabic-misc"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-100dpi/Config.in b/package/x11r7/xfont_font-bh-100dpi/Config.in
index dc405a2..3bfb0b8 100644
--- a/package/x11r7/xfont_font-bh-100dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-100dpi/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BH_100DPI
 	bool "font-bh-100dpi"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-75dpi/Config.in b/package/x11r7/xfont_font-bh-75dpi/Config.in
index 6cd334e..0fe93bb 100644
--- a/package/x11r7/xfont_font-bh-75dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-75dpi/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BH_75DPI
 	bool "font-bh-75dpi"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
index 0e082d5..0005cc1 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI
 	bool "font-bh-lucidatypewriter-100dpi"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
index 126fb85..60dfb95 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI
 	bool "font-bh-lucidatypewriter-75dpi"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-ttf/Config.in b/package/x11r7/xfont_font-bh-ttf/Config.in
index 2590798..d747989 100644
--- a/package/x11r7/xfont_font-bh-ttf/Config.in
+++ b/package/x11r7/xfont_font-bh-ttf/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BH_TTF
 	bool "font-bh-ttf"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-type1/Config.in b/package/x11r7/xfont_font-bh-type1/Config.in
index 047268c..0a3ab18 100644
--- a/package/x11r7/xfont_font-bh-type1/Config.in
+++ b/package/x11r7/xfont_font-bh-type1/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BH_TYPE1
 	bool "font-bh-type1"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/Config.in b/package/x11r7/xfont_font-bitstream-100dpi/Config.in
index 81393c5..5363fae 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/Config.in
+++ b/package/x11r7/xfont_font-bitstream-100dpi/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_100DPI
 	bool "font-bitstream-100dpi"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/Config.in b/package/x11r7/xfont_font-bitstream-75dpi/Config.in
index bada475..34a4a19 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/Config.in
+++ b/package/x11r7/xfont_font-bitstream-75dpi/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_75DPI
 	bool "font-bitstream-75dpi"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-type1/Config.in b/package/x11r7/xfont_font-bitstream-type1/Config.in
index d482a6d..c8cbc90 100644
--- a/package/x11r7/xfont_font-bitstream-type1/Config.in
+++ b/package/x11r7/xfont_font-bitstream-type1/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_TYPE1
 	bool "font-bitstream-type1"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/Config.in b/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
index a0085f5..e92ab83 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_CRONYX_CYRILLIC
 	bool "font-cronyx-cyrillic"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-cursor-misc/Config.in b/package/x11r7/xfont_font-cursor-misc/Config.in
index 03ed530..0e10da6 100644
--- a/package/x11r7/xfont_font-cursor-misc/Config.in
+++ b/package/x11r7/xfont_font-cursor-misc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_CURSOR_MISC
 	bool "font-cursor-misc"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-daewoo-misc/Config.in b/package/x11r7/xfont_font-daewoo-misc/Config.in
index 9e45341..cffe81d 100644
--- a/package/x11r7/xfont_font-daewoo-misc/Config.in
+++ b/package/x11r7/xfont_font-daewoo-misc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_DAEWOO_MISC
 	bool "font-daewoo-misc"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-dec-misc/Config.in b/package/x11r7/xfont_font-dec-misc/Config.in
index 326ea9b..a926d9f 100644
--- a/package/x11r7/xfont_font-dec-misc/Config.in
+++ b/package/x11r7/xfont_font-dec-misc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_DEC_MISC
 	bool "font-dec-misc"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-ibm-type1/Config.in b/package/x11r7/xfont_font-ibm-type1/Config.in
index 92783af..d4ac1ae 100644
--- a/package/x11r7/xfont_font-ibm-type1/Config.in
+++ b/package/x11r7/xfont_font-ibm-type1/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_IBM_TYPE1
 	bool "font-ibm-type1"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-isas-misc/Config.in b/package/x11r7/xfont_font-isas-misc/Config.in
index 2e77f66..4dddaf7 100644
--- a/package/x11r7/xfont_font-isas-misc/Config.in
+++ b/package/x11r7/xfont_font-isas-misc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ISAS_MISC
 	bool "font-isas-misc"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-jis-misc/Config.in b/package/x11r7/xfont_font-jis-misc/Config.in
index 6a59cce..1874ad8 100644
--- a/package/x11r7/xfont_font-jis-misc/Config.in
+++ b/package/x11r7/xfont_font-jis-misc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_JIS_MISC
 	bool "font-jis-misc"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-micro-misc/Config.in b/package/x11r7/xfont_font-micro-misc/Config.in
index 1420cbd..2062e16 100644
--- a/package/x11r7/xfont_font-micro-misc/Config.in
+++ b/package/x11r7/xfont_font-micro-misc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_MICRO_MISC
 	bool "font-micro-misc"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-cyrillic/Config.in b/package/x11r7/xfont_font-misc-cyrillic/Config.in
index e793d70..58702c1 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-misc-cyrillic/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_MISC_CYRILLIC
 	bool "font-misc-cyrillic"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-ethiopic/Config.in b/package/x11r7/xfont_font-misc-ethiopic/Config.in
index aa3b834..af62ddc 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/Config.in
+++ b/package/x11r7/xfont_font-misc-ethiopic/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_MISC_ETHIOPIC
 	bool "font-misc-ethiopic"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-meltho/Config.in b/package/x11r7/xfont_font-misc-meltho/Config.in
index dcc6c84..dd2d87d 100644
--- a/package/x11r7/xfont_font-misc-meltho/Config.in
+++ b/package/x11r7/xfont_font-misc-meltho/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_MISC_MELTHO
 	bool "font-misc-meltho"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-misc/Config.in b/package/x11r7/xfont_font-misc-misc/Config.in
index b3e4fc1..fc379a6 100644
--- a/package/x11r7/xfont_font-misc-misc/Config.in
+++ b/package/x11r7/xfont_font-misc-misc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_MISC_MISC
 	bool "font-misc-misc"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-mutt-misc/Config.in b/package/x11r7/xfont_font-mutt-misc/Config.in
index e27ea74..563dc9f 100644
--- a/package/x11r7/xfont_font-mutt-misc/Config.in
+++ b/package/x11r7/xfont_font-mutt-misc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_MUTT_MISC
 	bool "font-mutt-misc"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-schumacher-misc/Config.in b/package/x11r7/xfont_font-schumacher-misc/Config.in
index d37babc..e30940a 100644
--- a/package/x11r7/xfont_font-schumacher-misc/Config.in
+++ b/package/x11r7/xfont_font-schumacher-misc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_SCHUMACHER_MISC
 	bool "font-schumacher-misc"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-screen-cyrillic/Config.in b/package/x11r7/xfont_font-screen-cyrillic/Config.in
index a1f02d0..67f4ae6 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-screen-cyrillic/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_SCREEN_CYRILLIC
 	bool "font-screen-cyrillic"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-sony-misc/Config.in b/package/x11r7/xfont_font-sony-misc/Config.in
index a4ce4ab..df558c4 100644
--- a/package/x11r7/xfont_font-sony-misc/Config.in
+++ b/package/x11r7/xfont_font-sony-misc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_SONY_MISC
 	bool "font-sony-misc"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-sun-misc/Config.in b/package/x11r7/xfont_font-sun-misc/Config.in
index 07603a1..accc764 100644
--- a/package/x11r7/xfont_font-sun-misc/Config.in
+++ b/package/x11r7/xfont_font-sun-misc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_SUN_MISC
 	bool "font-sun-misc"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/Config.in b/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
index c804441..ccfb080 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_WINITZKI_CYRILLIC
 	bool "font-winitzki-cyrillic"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
diff --git a/package/x11r7/xfont_font-xfree86-type1/Config.in b/package/x11r7/xfont_font-xfree86-type1/Config.in
index b7d0587..1a897b2 100644
--- a/package/x11r7/xfont_font-xfree86-type1/Config.in
+++ b/package/x11r7/xfont_font-xfree86-type1/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_XFREE86_TYPE1
 	bool "font-xfree86-type1"
+	select BR2_PACKAGE_XFONT_FONT_UTIL
 	help
 	  No description available
