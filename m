From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 31 Oct 2018 16:22:42 +0100
Subject: [Buildroot] [PATCH 1/1] libxmlpp: bump to version 3.0.1
Message-ID: <20181031152242.3311-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxmlpp/libxmlpp.hash | 7 +++++--
 package/libxmlpp/libxmlpp.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libxmlpp/libxmlpp.hash b/package/libxmlpp/libxmlpp.hash
index 5fc7f5beb4..cc5247a116 100644
--- a/package/libxmlpp/libxmlpp.hash
+++ b/package/libxmlpp/libxmlpp.hash
@@ -1,2 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/2.40/libxml++-2.40.1.sha256sum
-sha256	4ad4abdd3258874f61c2e2a41d08e9930677976d303653cd1670d3e9f35463e9	libxml++-2.40.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/3.0/libxml++-3.0.1.sha256sum
+sha256	19dc8d21751806c015179bc0b83f978e65c878724501bfc0b6c1bcead29971a6	libxml++-3.0.1.tar.xz
+
+# Hash for license file
+sha256	a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7	COPYING
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index d0f6329e79..14a3d97a8f 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLPP_VERSION_MAJOR = 2.40
+LIBXMLPP_VERSION_MAJOR = 3.0
 LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).1
 LIBXMLPP_LICENSE = LGPL-2.1 (library), LGPL-2.0+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
-- 
2.17.1
