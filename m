From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Apr 2013 23:58:01 +0200
Subject: [Buildroot] [git commit] libid3tag: add license information
Message-ID: <20130415215908.477989B6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8a82b28597f98dad5d5add037e167666fcf3bdf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libid3tag/libid3tag.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index fc22976..fff8d8b 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -7,6 +7,8 @@
 LIBID3TAG_VERSION = 0.15.1b
 LIBID3TAG_SOURCE = libid3tag-$(LIBID3TAG_VERSION).tar.gz
 LIBID3TAG_SITE = http://downloads.sourceforge.net/project/mad/libid3tag/$(LIBID3TAG_VERSION)
+LIBID3TAG_LICENSE = GPLv2+
+LIBID3TAG_LICENSE_FILES = COPYING COPYRIGHT
 LIBID3TAG_INSTALL_STAGING = YES
 LIBID3TAG_DEPENDENCIES = zlib
 LIBID3TAG_LIBTOOL_PATCH = NO
