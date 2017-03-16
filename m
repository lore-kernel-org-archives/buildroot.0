From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 17 Mar 2017 00:02:06 +0100
Subject: [Buildroot] [PATCH v2] package/cairo: update license information
Message-ID: <20170316230206.14685-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As noticed by Rahul Bedarkar, the cairo library is LGPLv2.1 only
(not LGPLv2.1+) or MPLv1.1.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: remove LGPLv2.1+
    Specify MPL version
---
 package/cairo/cairo.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 761c6f4..ac91a56 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -6,8 +6,8 @@
 
 CAIRO_VERSION = 1.14.8
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
-CAIRO_LICENSE = LGPLv2.1+
-CAIRO_LICENSE_FILES = COPYING
+CAIRO_LICENSE = LGPLv2.1 or MPLv1.1 (library)
+CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
 CAIRO_AUTORECONF = YES
-- 
2.9.3
