From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:41:07 +0200
Subject: [Buildroot] [git commit] zlib: add license information
Message-ID: <20120821110312.3B7EC97206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd71973d8464ec0860b43ec00048895585c05b88
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zlib/zlib.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index a9d4a8f..2ddab62 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -7,6 +7,8 @@
 ZLIB_VERSION = 1.2.7
 ZLIB_SOURCE =zlib-$(ZLIB_VERSION).tar.bz2
 ZLIB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
+ZLIB_LICENSE = zlib license
+ZLIB_LICENSE_FILES = README
 ZLIB_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
