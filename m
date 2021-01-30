From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 13:29:56 +0100
Subject: [Buildroot] [git commit] package/wayland: add WAYLAND_CPE_ID_VENDOR
Message-ID: <20210130121305.4F18C83848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f8606f2aa39e460f43570c2e5472b7fb2d697c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:wayland:wayland is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awayland%3Awayland

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
