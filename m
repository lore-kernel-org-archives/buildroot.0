From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 21:39:49 +0100
Subject: [Buildroot] [git commit] package/libcdio-paranoia: bump to version
 10.2+2.0.1
Message-ID: <20191230203057.DEBD88E882@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04aeafaa7da41c26e5a96118cb22dc295c8d98ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcdio-paranoia/libcdio-paranoia.hash | 2 +-
 package/libcdio-paranoia/libcdio-paranoia.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcdio-paranoia/libcdio-paranoia.hash b/package/libcdio-paranoia/libcdio-paranoia.hash
index a62620dfd6..18e6f33dff 100644
--- a/package/libcdio-paranoia/libcdio-paranoia.hash
+++ b/package/libcdio-paranoia/libcdio-paranoia.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 4565c18caf401083c53733e6d2847b6671ba824cff1c7792b9039693d34713c1  libcdio-paranoia-10.2+2.0.0.tar.bz2
+sha256 33b1cf305ccfbfd03b43936975615000ce538b119989c4bec469577570b60e8a  libcdio-paranoia-10.2+2.0.1.tar.bz2
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio-paranoia/libcdio-paranoia.mk b/package/libcdio-paranoia/libcdio-paranoia.mk
index 32b1f169b4..944bb14d77 100644
--- a/package/libcdio-paranoia/libcdio-paranoia.mk
+++ b/package/libcdio-paranoia/libcdio-paranoia.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCDIO_PARANOIA_VERSION = 10.2+2.0.0
+LIBCDIO_PARANOIA_VERSION = 10.2+2.0.1
 LIBCDIO_PARANOIA_SOURCE = libcdio-paranoia-$(LIBCDIO_PARANOIA_VERSION).tar.bz2
 LIBCDIO_PARANOIA_SITE = $(BR2_GNU_MIRROR)/libcdio
 LIBCDIO_PARANOIA_LICENSE = GPL-3.0+
