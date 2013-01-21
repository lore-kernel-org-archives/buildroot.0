From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 23:52:21 +0100
Subject: [Buildroot] [git commit] libvorbis: add license information
Message-ID: <20130121225448.9D1A79A6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a016d2148816961b27bbe05bd869024fccf02f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libvorbis/libvorbis.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index c8ff213..ace8147 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -8,9 +8,9 @@ LIBVORBIS_VERSION = 1.3.3
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
 LIBVORBIS_INSTALL_STAGING = YES
-
 LIBVORBIS_CONF_OPT = --disable-oggtest
-
 LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
+LIBVORBIS_LICENSE = BSD-3c
+LIBVORBIS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
