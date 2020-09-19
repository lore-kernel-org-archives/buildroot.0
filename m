From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 22:00:04 +0200
Subject: [Buildroot] [git commit] package/wayland-protocols: change download
 url to https
Message-ID: <20200919200134.BFF7388375@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79609dd78f9054de74120da45defb3fdf693410d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change download url to https (as redirected by the original http url)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wayland-protocols/wayland-protocols.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index ed60d1c995..84028b97d5 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WAYLAND_PROTOCOLS_VERSION = 1.20
-WAYLAND_PROTOCOLS_SITE = http://wayland.freedesktop.org/releases
+WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
 WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
