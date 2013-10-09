From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Oct 2013 23:44:18 +0200
Subject: [Buildroot] [PATCH 2/9] package/weston: bump version
In-Reply-To: <cover.1381354867.git.yann.morin.1998@free.fr>
References: <cover.1381354867.git.yann.morin.1998@free.fr>
Message-ID: <9d8038a8ce59364297a31919b66884abe35b40a2.1381354867.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/weston.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 38647bd..990fb04 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.1.0
+WESTON_VERSION = 1.2.2
 WESTON_SITE = http://wayland.freedesktop.org/releases/
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
-- 
1.8.1.2
