From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:51 -0300
Subject: [Buildroot] [PATCH 45/54] x11vnc: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-45-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11vnc/x11vnc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
1.8.5.5
