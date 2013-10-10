From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Oct 2013 23:05:18 +0200
Subject: [Buildroot] [PATCH 1/8] package/wayland: bump version
In-Reply-To: <cover.1381438785.git.yann.morin.1998@free.fr>
References: <cover.1381438785.git.yann.morin.1998@free.fr>
Message-ID: <cc7248d0a8221d578be69185323018e9f43fc22f.1381438785.git.yann.morin.1998@free.fr>
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
index b5fe94d..0810536 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.1.0
+WAYLAND_VERSION = 1.2.1
 WAYLAND_SITE = http://wayland.freedesktop.org/releases/
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
1.8.1.2
