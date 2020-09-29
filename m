From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 15:58:07 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/wayland-protocols: change download url to https
Message-ID: <20200929134928.3B8E6862EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=360273fa69fa178985481dd46500262ad0b91636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- change download url to https (as redirected by the original http url)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 79609dd78f9054de74120da45defb3fdf693410d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wayland-protocols/wayland-protocols.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index fbfa99558d..20a933087d 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WAYLAND_PROTOCOLS_VERSION = 1.18
-WAYLAND_PROTOCOLS_SITE = http://wayland.freedesktop.org/releases
+WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
 WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
