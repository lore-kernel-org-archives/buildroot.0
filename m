From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Jan 2014 23:07:58 +0100
Subject: [Buildroot] [PATCH 1/3] package/wayland: bump to 1.4.0
In-Reply-To: <cover.1391033178.git.yann.morin.1998@free.fr>
References: <cover.1391033178.git.yann.morin.1998@free.fr>
Message-ID: <d0ae82ce6b6b8c983e129ed4cc772fc32740a129.1391033178.git.yann.morin.1998@free.fr>
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
index b6fa4be..a823d2b 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.3.0
+WAYLAND_VERSION = 1.4.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases/
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
1.8.1.2
