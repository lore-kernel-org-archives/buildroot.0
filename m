From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 11 Dec 2017 08:34:54 +0100
Subject: [Buildroot] [PATCH] libostree: depend on host-bison
Message-ID: <20171211073454.27812-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/9179b65a5a90d53490d9e109c45341f1104406a3

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 3ac8278a98..cddde379df 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -10,7 +10,7 @@ LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOST
 
 LIBOSTREE_LICENSE = LGPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
-LIBOSTREE_DEPENDENCIES = e2fsprogs host-pkgconf libfuse libglib2 libgpgme xz
+LIBOSTREE_DEPENDENCIES = e2fsprogs host-bison host-pkgconf libfuse libglib2 libgpgme xz
 LIBOSTREE_INSTALL_STAGING = YES
 
 LIBOSTREE_CONF_OPTS += \
-- 
2.15.0
