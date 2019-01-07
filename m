From: Martin Kepplinger <martink@posteo.de>
Date: Mon,  7 Jan 2019 12:32:27 +0100
Subject: [Buildroot] [PATCH] x11vnc: update to 0.9.16
Message-ID: <20190107113227.31452-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update x11vnc from 0.9.15 to 0.9.16. For the changes, see
https://github.com/LibVNC/x11vnc/compare/0.9.15...0.9.16

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 package/x11vnc/x11vnc.hash | 2 +-
 package/x11vnc/x11vnc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11vnc/x11vnc.hash b/package/x11vnc/x11vnc.hash
index 86f41044db..205a5dce4c 100644
--- a/package/x11vnc/x11vnc.hash
+++ b/package/x11vnc/x11vnc.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  3e43bd875edc3c7f52a0d3676c4ec7de910fcd210240ee20b4522deb2bf84cff  x11vnc-0.9.15.tar.gz
+sha256  885e5b5f5f25eec6f9e4a1e8be3d0ac71a686331ee1cfb442dba391111bd32bd  x11vnc-0.9.16.tar.gz
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 0fa87d2d82..9daf490581 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X11VNC_VERSION = 0.9.15
+X11VNC_VERSION = 0.9.16
 X11VNC_SITE = $(call github,LibVNC,x11vnc,$(X11VNC_VERSION))
 # sdl support is not used in x11vnc, but host include / library search paths
 # leak in if host has sdl-config
-- 
2.11.0
