From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Oct 2017 20:43:37 +0100
Subject: [Buildroot] [git commit] libmediaart: bump to version 1.9.4
Message-ID: <20171030193655.70C1480737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f7499471d466fadc198541b62ee55843c5a5579
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmediaart/libmediaart.hash | 4 ++--
 package/libmediaart/libmediaart.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
index 46e4035..65cf3cf 100644
--- a/package/libmediaart/libmediaart.hash
+++ b/package/libmediaart/libmediaart.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.1.sha256sum:
-sha256	5b14aa4e0cc84eaec57b6cb28f39092d503fdaecf36d5d165fac37583b7fe949	libmediaart-1.9.1.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.4.sha256sum:
+sha256	a57be017257e4815389afe4f58fdacb6a50e74fd185452b23a652ee56b04813d	libmediaart-1.9.4.tar.xz
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index cac45f1..db4f1fa 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMEDIAART_VERSION_MAJOR = 1.9
-LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).1
+LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).4
 LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
 LIBMEDIAART_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
