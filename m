From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  2 Jun 2016 21:57:44 -0300
Subject: [Buildroot] [PATCH] weston: drop autoreconf
Message-ID: <1464915464-28157-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's unnecessary as pointed by Thomas P.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 6902658..dfcb9ac 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -9,8 +9,6 @@ WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
-# For 0002-build-add-check-for-clock_gettime-in-librt.patch
-WESTON_AUTORECONF = YES
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 	libxkbcommon pixman libpng jpeg mtdev udev cairo libinput \
-- 
2.7.3
