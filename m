From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  9 Sep 2020 17:14:21 +0200
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 2.6.8
Message-ID: <20200909151421.1874448-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff COPING:
-Copyright ? 2010,2011,2012,2013,2014,2015,2016,2017,2018,2019  Google, Inc.
-Copyright ? 2019  Facebook, Inc.
+Copyright ? 2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020  Google, Inc.
+Copyright ? 2018,2019,2020  Ebrahim Byagowi
+Copyright ? 2019,2020  Facebook, Inc.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/harfbuzz/Config.in     | 2 +-
 package/harfbuzz/harfbuzz.hash | 6 ++----
 package/harfbuzz/harfbuzz.mk   | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index e8f407bb8..27fa102e1 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HARFBUZZ
 	help
 	  HarfBuzz is an OpenType text shaping engine
 
-	  http://www.freedesktop.org/wiki/Software/HarfBuzz/
+	  https://harfbuzz.github.io/
 
 	  Harfbuzz can make optional use of cairo, freetype,
 	  glib2 and icu packages if they are selected.
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index ba54f477a..660e19efc 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,5 +1,3 @@
-# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.6.4.tar.xz.sha256
-sha256 9413b8d96132d699687ef914ebb8c50440efc87b3f775d25856d7ec347c03c12  harfbuzz-2.6.4.tar.xz
-
 # Locally computed
-sha256 1b32b6e2fea50440c128c5ba482f7691367c46fd0cd573b80fc863bf07964cea  COPYING
+sha256  6648a571a27f186e47094121f0095e1b809e918b3037c630c7f38ffad86e3035  harfbuzz-2.6.8.tar.xz
+sha256  beb3f017ceb41387667f78237a7cecf84defa0ed257c505894663d6a9f13211b  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 3006b5ab9..c7bb8f934 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.6.4
-HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
+HARFBUZZ_VERSION = 2.6.8
+HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING
-- 
2.25.1
