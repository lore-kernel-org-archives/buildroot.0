From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Mar 2021 08:13:29 +0100
Subject: [Buildroot] [git commit] package/librsvg: add LIBRSVG_CPE_ID_VENDOR
Message-ID: <20210304065255.27BB686DAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61eff3f98818aef8e329075c183cff862f33ea40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnome:librsvg is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Alibrsvg

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librsvg/librsvg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 6a45fc97e2..5eeb68f9b8 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -19,6 +19,7 @@ LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf host-rustc libglib2 libx
 HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libglib2 host-libxml2 host-pango host-rustc
 LIBRSVG_LICENSE = LGPL-2.1+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
+LIBRSVG_CPE_ID_VENDOR = gnome
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBRSVG_CONF_OPTS += --enable-introspection
