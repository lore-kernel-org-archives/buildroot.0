From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:23 +0200
Subject: [Buildroot] [PATCH v1 03/28] package/libglu: replace utf-8
 apostrophe by ascii single quote
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-# upstream does not distribute a autoconf?ed configure script
+# upstream does not distribute a autoconf'ed configure script
 LIBGLU_AUTORECONF = YES
 LIBGLU_DEPENDENCIES = libgl host-pkgconf

--
2.21.0
