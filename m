From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Mar 2017 23:07:38 +0100
Subject: [Buildroot] [git commit] package/cairo: update license information
Message-ID: <20170317223641.88F5B7FB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0768932a0229b2c201c292023f59a868ecdb1222
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noticed by Rahul Bedarkar, the cairo library is LGPLv2.1 only
(not LGPLv2.1+) or MPLv1.1.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
