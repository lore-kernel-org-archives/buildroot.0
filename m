From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Jun 2013 08:48:57 +0200
Subject: [Buildroot] [git commit] libmpeg2: add license info
Message-ID: <20130604065155.17BB59A918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=573af015bec8dfa89f11d3796bc8dc2df5d5817f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, remove trailing slash from site.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmpeg2/libmpeg2.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index dbb7114..f3cf245 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -5,7 +5,9 @@
 #############################################################
 LIBMPEG2_VERSION = 0.5.1
 LIBMPEG2_SOURCE = libmpeg2-$(LIBMPEG2_VERSION).tar.gz
-LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files/
+LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files
+LIBMPEG2_LICENSE = GPLv2+
+LIBMPEG2_LICENSE_FILES = COPYING
 LIBMPEG2_INSTALL_STAGING = YES
 LIBMPEG2_AUTORECONF = YES
 LIBMPEG2_CONF_OPT = --without-x --disable-directx
