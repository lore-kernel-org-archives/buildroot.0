From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 15 Sep 2020 20:13:21 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/wayland-protocols: change
 download url to https
Message-ID: <20200915181322.8364-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change download url to https (as redirected by the original http url)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-- 
2.28.0
