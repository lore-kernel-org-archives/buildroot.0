From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 21:51:07 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/weston: add
 WESTON_CPE_ID_VENDOR
Message-ID: <20210519192210.471AA88769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd71a0ffd89312d82bbfe8f3a659568aa8044472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:wayland:weston is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awayland%3Aweston

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bbfc6f546e36a2404786055ffbce41d2cdfc393a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
