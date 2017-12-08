From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 08:39:26 +0100
Subject: [Buildroot] [git commit] libostree: change license to LGPL-2.0+
Message-ID: <20171208073339.588538283D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2995abf4e4370b1643e165923d3da65f099080d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license is actually GNU LIBRARY GENERAL PUBLIC LICENSE

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libostree/libostree.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 113ed42..1d5936a 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -8,7 +8,7 @@ LIBOSTREE_VERSION = 2017.13
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-LIBOSTREE_LICENSE = GPL-2.0+
+LIBOSTREE_LICENSE = LGPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
 LIBOSTREE_DEPENDENCIES = e2fsprogs host-pkgconf libfuse libglib2 libgpgme xz
 LIBOSTREE_INSTALL_STAGING = YES
