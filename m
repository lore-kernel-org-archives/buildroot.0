From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 18:09:24 +0100
Subject: [Buildroot] [git commit] package/libxmlpp: bump to version 3.2.0
Message-ID: <20200213170142.88BF28DF6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a583a9fd1a13158a4ff30e11ce8172fe5938ebdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site in Config.in, see
  https://gitlab.gnome.org/GNOME/libxmlplusplus/commit/604ae3c286a20683f9688f8da5221b3bf89886d0
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxmlpp/Config.in     | 2 +-
 package/libxmlpp/libxmlpp.hash | 6 +++---
 package/libxmlpp/libxmlpp.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
index 7244586841..3249a84398 100644
--- a/package/libxmlpp/Config.in
+++ b/package/libxmlpp/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_LIBXMLPP
 	help
 	  libxml++ is a C++ wrapper for the libxml XML parser library.
 
-	  http://libxmlplusplus.sourceforge.net/
+	  https://libxmlplusplus.github.io/libxmlplusplus/
 
 comment "libxml++ needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
diff --git a/package/libxmlpp/libxmlpp.hash b/package/libxmlpp/libxmlpp.hash
index cc5247a116..7a59880e7e 100644
--- a/package/libxmlpp/libxmlpp.hash
+++ b/package/libxmlpp/libxmlpp.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/3.0/libxml++-3.0.1.sha256sum
-sha256	19dc8d21751806c015179bc0b83f978e65c878724501bfc0b6c1bcead29971a6	libxml++-3.0.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/3.2/libxml++-3.2.0.sha256sum
+sha256  b786fae7fd7820d356698069a787d107995c3efcbef50d8f4efd3766ab768e4f  libxml++-3.2.0.tar.xz
 
 # Hash for license file
-sha256	a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7	COPYING
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index 14a3d97a8f..98cba2a5a2 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBXMLPP_VERSION_MAJOR = 3.0
-LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).1
+LIBXMLPP_VERSION_MAJOR = 3.2
+LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).0
 LIBXMLPP_LICENSE = LGPL-2.1 (library), LGPL-2.0+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
