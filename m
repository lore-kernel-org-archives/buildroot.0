From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu,  7 Dec 2017 13:03:13 +0100
Subject: [Buildroot] [PATCH] libostree: change license to LGPL-2.0+
Message-ID: <20171207120313.25510-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license is actually GNU LIBRARY GENERAL PUBLIC LICENSE

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index b43c228068..3ac8278a98 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -8,7 +8,7 @@ LIBOSTREE_VERSION = 2017.14
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-LIBOSTREE_LICENSE = GPL-2.0+
+LIBOSTREE_LICENSE = LGPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
 LIBOSTREE_DEPENDENCIES = e2fsprogs host-pkgconf libfuse libglib2 libgpgme xz
 LIBOSTREE_INSTALL_STAGING = YES
-- 
2.15.0
