From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Mar 2021 20:16:55 +0100
Subject: [Buildroot] [PATCH v2,
 2/4] package/libfm-extra: bump to version 1.3.2
In-Reply-To: <20210315191657.2150193-1-fontaine.fabrice@gmail.com>
References: <20210315191657.2150193-1-fontaine.fabrice@gmail.com>
Message-ID: <20210315191657.2150193-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfm-extra/libfm-extra.hash | 11 ++++++-----
 package/libfm-extra/libfm-extra.mk   |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/libfm-extra/libfm-extra.hash b/package/libfm-extra/libfm-extra.hash
index e78fbab0de..116cefb053 100644
--- a/package/libfm-extra/libfm-extra.hash
+++ b/package/libfm-extra/libfm-extra.hash
@@ -1,7 +1,8 @@
 # From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/LibFM/
-md5	c15ecd2c9317e2c385cd3f046d0b61ba	libfm-1.3.1.tar.xz
-sha1	29539f50acd5c00a00362adffd532053b0688e66	libfm-1.3.1.tar.xz
+md5  c87a0ff41ae77825079b2f785ec0741e  libfm-1.3.2.tar.xz
+sha1  7c5c14dd0615b457687966ce4e55c2d054bf93e1  libfm-1.3.2.tar.xz
 
-# Hash for license files:
-sha256	d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388	COPYING
-sha256	c3a3d93e111462f2b0292b56a6a7b87d342fd7156741d8b81b8b08723be4597e	src/extra/fm-xml-file.c
+# Locally computed:
+sha256  a5042630304cf8e5d8cff9d565c6bd546f228b48c960153ed366a34e87cad1e5  libfm-1.3.2.tar.gz
+sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
+sha256  c3a3d93e111462f2b0292b56a6a7b87d342fd7156741d8b81b8b08723be4597e  src/extra/fm-xml-file.c
diff --git a/package/libfm-extra/libfm-extra.mk b/package/libfm-extra/libfm-extra.mk
index b41e8654b0..2a5df9cab6 100644
--- a/package/libfm-extra/libfm-extra.mk
+++ b/package/libfm-extra/libfm-extra.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFM_EXTRA_VERSION = 1.3.1
+LIBFM_EXTRA_VERSION = 1.3.2
 LIBFM_EXTRA_SOURCE = libfm-$(LIBFM_EXTRA_VERSION).tar.xz
 LIBFM_EXTRA_SITE = http://sourceforge.net/projects/pcmanfm/files
 LIBFM_EXTRA_DEPENDENCIES = libglib2 host-intltool
-- 
2.30.0
