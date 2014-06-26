From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 17:10:05 +0200
Subject: [Buildroot] [git commit] x11vnc: add license information
Message-ID: <20140626151144.7BA329D018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3917c6163ae17f1723b44aafb0dbf4825c507b5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11vnc/x11vnc.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index a2d68f6..bd0f530 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -9,8 +9,9 @@ X11VNC_SITE = http://downloads.sourceforge.net/project/libvncserver/x11vnc/$(X11
 # sdl support is not used in x11vnc, but host include / library search paths
 # leak in if host has sdl-config
 X11VNC_CONF_OPT = --without-sdl
-
 X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst
+X11VNC_LICENSE = GPLv2+
+X11VNC_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_INET_IPV6),y)
 # configure option only used for libvncserver
