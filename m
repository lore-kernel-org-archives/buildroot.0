From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 20:22:23 +0200
Subject: [Buildroot] [git commit] libtpl: add license information
Message-ID: <20120811182241.CC6AA90B7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0e1710c916a081d6e02daf804a585d2a9a0fd39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtpl/libtpl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index 45089b5..7af0b06 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -7,5 +7,7 @@ LIBTPL_VERSION = 1.5
 LIBTPL_SOURCE = libtpl-$(LIBTPL_VERSION).tar.bz2
 LIBTPL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tpl
 LIBTPL_INSTALL_STAGING = YES
+LIBTPL_LICENSE = BSD-like
+LIBTPL_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
