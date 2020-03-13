From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 13 Mar 2020 22:14:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgee: bump to version 0.20.3
Message-ID: <20200313211437.1272988-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgee/libgee.hash | 6 +++---
 package/libgee/libgee.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
index e1861d514a..c82651c68a 100644
--- a/package/libgee/libgee.hash
+++ b/package/libgee/libgee.hash
@@ -1,5 +1,5 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.2.sha256sum
-sha256	9e035c4b755f46bfae70ba81cdcf8328b03f554373cec8c816e8b5680f85353c	libgee-0.20.2.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.3.sha256sum
+sha256  d0b5edefc88cbca5f1709d19fa62aef490922c6577a14ac4e7b085507911a5de  libgee-0.20.3.tar.xz
 
 # Hash for license file:
-sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	COPYING
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index fa4c46e733..81fd354fe8 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGEE_VERSION_MAJOR = 0.20
-LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).2
+LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).3
 LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJOR)
 LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
 LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
-- 
2.25.1
