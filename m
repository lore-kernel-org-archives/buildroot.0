From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue,  3 Apr 2012 10:55:31 +0200
Subject: [Buildroot] [PATCH 3/4] Fix libpng url
In-Reply-To: <cover.1333443312.git.maxime.ripard@free-electrons.com>
References: <cover.1333443312.git.maxime.ripard@free-electrons.com>
Message-ID: <79dd445eff0fb475cb94a6c03626db9fdb72f30f.1333443312.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/libpng/libpng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 19d2a71..0d6a008 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -6,7 +6,7 @@
 
 LIBPNG_VERSION = 1.4.10
 LIBPNG_SERIES = 14
-LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
+LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/older-releases/$(LIBPNG_VERSION)
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
-- 
1.7.5.4
