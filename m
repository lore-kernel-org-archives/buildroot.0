From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 19:13:29 +0200
Subject: [Buildroot] [PATCH 3/4] package/wayland: bump to 1.3.0
In-Reply-To: <cover.1381770790.git.yann.morin.1998@free.fr>
References: <cover.1381770790.git.yann.morin.1998@free.fr>
Message-ID: <fc186c86ea6995a655b51098616be6e002ae64fb.1381770790.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/wayland/wayland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 013d401..b6fa4be 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.2.1
+WAYLAND_VERSION = 1.3.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases/
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
1.8.1.2
