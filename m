From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 18:21:16 +0200
Subject: [Buildroot] [git commit] package/libgee: bump to version 0.20.4
Message-ID: <20210405160039.98B088B774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1e6c3339070fc2cbd500252cecea7732cbeb140
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/libgee/-/blob/0.20.4/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgee/libgee.hash | 4 ++--
 package/libgee/libgee.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
index c82651c68a..72d2c21ced 100644
--- a/package/libgee/libgee.hash
+++ b/package/libgee/libgee.hash
@@ -1,5 +1,5 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.3.sha256sum
-sha256  d0b5edefc88cbca5f1709d19fa62aef490922c6577a14ac4e7b085507911a5de  libgee-0.20.3.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.4.sha256sum
+sha256  524c1bf390f9cdda4fbd9a47b269980dc64ab5280f0801b53bc69d782c72de0e  libgee-0.20.4.tar.xz
 
 # Hash for license file:
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 4b2581e171..48bc9c9e41 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGEE_VERSION_MAJOR = 0.20
-LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).3
+LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).4
 LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJOR)
 LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
 LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
