From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Jan 2021 20:56:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/wayland: add WAYLAND_CPE_ID_VENDOR
Message-ID: <20210128195603.4162109-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:wayland:wayland is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awayland%3Awayland

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wayland/wayland.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 1b19272715..6cb4a50dbb 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -9,6 +9,7 @@ WAYLAND_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
 WAYLAND_LICENSE_FILES = COPYING
+WAYLAND_CPE_ID_VENDOR = wayland
 WAYLAND_INSTALL_STAGING = YES
 WAYLAND_DEPENDENCIES = host-pkgconf host-wayland expat libffi libxml2
 HOST_WAYLAND_DEPENDENCIES = host-pkgconf host-expat host-libffi host-libxml2
-- 
2.29.2
