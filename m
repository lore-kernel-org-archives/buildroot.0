From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 11:02:54 +0200
Subject: [Buildroot] [git commit] package/libva: bump version to 1.6.0
Message-ID: <20150702090455.EB7B6818D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5e5464b4a2037357d4d0d0208ef596a560e66bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva/libva.hash |    4 ++--
 package/libva/libva.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index eaec0af..82802ce 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/libva/2015-March/003249.html
-sha1	b315a86fcd3bd1e073e2c1b62416550885cd7420	libva-1.5.1.tar.bz2
+# From http://lists.freedesktop.org/archives/libva/2015-July/003404.html
+sha1	f9d0cc8edb90a73146cc755f9e4ab94ddcdf8cd6	libva-1.6.0.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index d3b58ae..18a322c 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.5.1
+LIBVA_VERSION = 1.6.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
