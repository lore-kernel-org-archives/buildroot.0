From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Oct 2013 07:56:34 +0200
Subject: [Buildroot] [git commit] package/wayland: bump to 1.3.0
Message-ID: <20131015064209.EB6119BA14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e80b7072a5394ca13272a9ed36c4de96472ff91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wayland/wayland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
