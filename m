From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 21:09:04 +0200
Subject: [Buildroot] [PATCH 2/4] libfm-extra: bump to version 1.3.0.2
In-Reply-To: <20180429190906.25476-1-fontaine.fabrice@gmail.com>
References: <20180429190906.25476-1-fontaine.fabrice@gmail.com>
Message-ID: <20180429190906.25476-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfm-extra/libfm-extra.hash | 8 ++++++--
 package/libfm-extra/libfm-extra.mk   | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/libfm-extra/libfm-extra.hash b/package/libfm-extra/libfm-extra.hash
index 8a78adebb4..233abe7d75 100644
--- a/package/libfm-extra/libfm-extra.hash
+++ b/package/libfm-extra/libfm-extra.hash
@@ -1,3 +1,7 @@
 # From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/LibFM/
-md5	74997d75e7e87dc73398746fd373bf52	libfm-1.2.4.tar.xz
-sha1	2f8183389c8e74edb15c6c8ab260df5dd39f3b2d	libfm-1.2.4.tar.xz
+md5	02a024714d51e0d37afc7bd596a44f3b	libfm-1.3.0.2.tar.xz
+sha1	aa7f73987866e557b74b8a28d0fea339d53899b6	libfm-1.3.0.2.tar.xz
+
+# Hash for license files:
+sha256	d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388	COPYING
+sha256	c3a3d93e111462f2b0292b56a6a7b87d342fd7156741d8b81b8b08723be4597e	src/extra/fm-xml-file.c
diff --git a/package/libfm-extra/libfm-extra.mk b/package/libfm-extra/libfm-extra.mk
index 67d6dc1294..7802b88631 100644
--- a/package/libfm-extra/libfm-extra.mk
+++ b/package/libfm-extra/libfm-extra.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFM_EXTRA_VERSION = 1.2.4
+LIBFM_EXTRA_VERSION = 1.3.0.2
 LIBFM_EXTRA_SOURCE = libfm-$(LIBFM_EXTRA_VERSION).tar.xz
 LIBFM_EXTRA_SITE = http://sourceforge.net/projects/pcmanfm/files
 LIBFM_EXTRA_DEPENDENCIES = libglib2 host-intltool
-- 
2.14.1
