From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 15:03:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libupnp18: bump to version 1.8.7
Message-ID: <20200421130329.3558402-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnp18/libupnp18.hash | 8 ++++----
 package/libupnp18/libupnp18.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libupnp18/libupnp18.hash b/package/libupnp18/libupnp18.hash
index 68aee9ba62..ba9ce1bcdf 100644
--- a/package/libupnp18/libupnp18.hash
+++ b/package/libupnp18/libupnp18.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/pupnp/files/pupnp/libupnp-1.8.6/libupnp-1.8.6.tar.bz2.sha1
-sha1 6132a949d7536dac835172609d1def1e7f2bd232  libupnp-1.8.6.tar.bz2
+# From https://sourceforge.net/projects/pupnp/files/pupnp/libupnp-1.8.7/libupnp-1.8.7.tar.bz2.sha1
+sha1  2ea3011180c58b0584f0cb73cc8e685a0a1c4ec8  libupnp-1.8.7.tar.bz2
 # Locally computed:
-sha256	65faf240f8ccee50cc0e7fe7fb21dcd79f743fc227a9b652b091f50f6956c2c7	libupnp-1.8.6.tar.bz2
-sha256	c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3	COPYING
+sha256  e38c69b2b67322e67cd53680db9b02c7c1f720a47a3cd626fd89d57d2dca93b8  libupnp-1.8.7.tar.bz2
+sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
index f73c656831..f17a1a720d 100644
--- a/package/libupnp18/libupnp18.mk
+++ b/package/libupnp18/libupnp18.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP18_VERSION = 1.8.6
+LIBUPNP18_VERSION = 1.8.7
 LIBUPNP18_SOURCE = libupnp-$(LIBUPNP18_VERSION).tar.bz2
 LIBUPNP18_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libupnp-$(LIBUPNP18_VERSION)
 LIBUPNP18_CONF_ENV = ac_cv_lib_compat_ftime=no
-- 
2.25.1
