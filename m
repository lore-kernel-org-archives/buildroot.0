From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 22:57:05 +0200
Subject: [Buildroot] [git commit] package/libglu: replace utf-8 apostrophe
 by ascii single quote
Message-ID: <20190507210157.C6D02815D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6522adddacb6ebea7ec4b29cb2bab70250dcde4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglu/libglu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
index 0e5242f85e..604045c225 100644
--- a/package/libglu/libglu.mk
+++ b/package/libglu/libglu.mk
@@ -10,7 +10,7 @@ LIBGLU_SOURCE = glu-$(LIBGLU_VERSION).tar.gz
 LIBGLU_LICENSE = SGI-B-2.0
 LIBGLU_LICENSE_FILES = include/GL/glu.h
 LIBGLU_INSTALL_STAGING = YES
-# upstream does not distribute a autoconf??ed configure script
+# upstream does not distribute a autoconf'ed configure script
 LIBGLU_AUTORECONF = YES
 LIBGLU_DEPENDENCIES = libgl host-pkgconf
 
