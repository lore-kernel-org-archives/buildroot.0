From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:44:47 +0200
Subject: [Buildroot] [git commit] weston: drop autoreconf
Message-ID: <20160603074451.9249081FBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73763ab9afce8e6d3e677f42b2172ed7a6d81a37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's unnecessary as pointed by Thomas P.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
