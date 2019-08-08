From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  8 Aug 2019 10:03:24 +0200
Subject: [Buildroot] [PATCH 3/4] package/libfm-extra: bump to version 1.3.1
In-Reply-To: <20190808080325.4182-1-fontaine.fabrice@gmail.com>
References: <20190808080325.4182-1-fontaine.fabrice@gmail.com>
Message-ID: <20190808080325.4182-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfm-extra/libfm-extra.hash | 4 ++--
 package/libfm-extra/libfm-extra.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libfm-extra/libfm-extra.hash b/package/libfm-extra/libfm-extra.hash
index 233abe7d75..e78fbab0de 100644
--- a/package/libfm-extra/libfm-extra.hash
+++ b/package/libfm-extra/libfm-extra.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/LibFM/
-md5	02a024714d51e0d37afc7bd596a44f3b	libfm-1.3.0.2.tar.xz
-sha1	aa7f73987866e557b74b8a28d0fea339d53899b6	libfm-1.3.0.2.tar.xz
+md5	c15ecd2c9317e2c385cd3f046d0b61ba	libfm-1.3.1.tar.xz
+sha1	29539f50acd5c00a00362adffd532053b0688e66	libfm-1.3.1.tar.xz
 
 # Hash for license files:
 sha256	d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388	COPYING
diff --git a/package/libfm-extra/libfm-extra.mk b/package/libfm-extra/libfm-extra.mk
index 7802b88631..b41e8654b0 100644
--- a/package/libfm-extra/libfm-extra.mk
+++ b/package/libfm-extra/libfm-extra.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFM_EXTRA_VERSION = 1.3.0.2
+LIBFM_EXTRA_VERSION = 1.3.1
 LIBFM_EXTRA_SOURCE = libfm-$(LIBFM_EXTRA_VERSION).tar.xz
 LIBFM_EXTRA_SITE = http://sourceforge.net/projects/pcmanfm/files
 LIBFM_EXTRA_DEPENDENCIES = libglib2 host-intltool
-- 
2.20.1
