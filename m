From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 Mar 2017 22:02:18 +0100
Subject: [Buildroot] [PATCH] package/cairo: improve license information
Message-ID: <20170306210218.28867-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cairo can be licenced under MPL and license copy are in COPYING-LGPL-2.1
and COPYING-MPL-1.1.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/cairo/cairo.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 761c6f4..137d348 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -6,8 +6,8 @@
 
 CAIRO_VERSION = 1.14.8
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
-CAIRO_LICENSE = LGPLv2.1+
-CAIRO_LICENSE_FILES = COPYING
+CAIRO_LICENSE = LGPLv2.1+ or MPL
+CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
 CAIRO_AUTORECONF = YES
-- 
2.9.3
