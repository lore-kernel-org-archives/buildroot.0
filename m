From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 19:10:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston: add WESTON_CPE_ID_VENDOR
Message-ID: <20210516171034.4406-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:wayland:weston is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awayland%3Aweston

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/weston/weston.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index f59963bf2e..8afe4bbab4 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -9,6 +9,7 @@ WESTON_SITE = https://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
+WESTON_CPE_ID_VENDOR = wayland
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm
-- 
2.30.2
