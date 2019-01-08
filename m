From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jan 2019 16:12:29 +0100
Subject: [Buildroot] [git commit] x11vnc: update to 0.9.16
Message-ID: <20190108151257.6826C8B49C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a328ba7e547464686b36ca68cb24c99ad6f7475
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update x11vnc from 0.9.15 to 0.9.16. For the changes, see
https://github.com/LibVNC/x11vnc/compare/0.9.15...0.9.16

Signed-off-by: Martin Kepplinger <martink@posteo.de>
[Peter: add hash for COPYING]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11vnc/x11vnc.hash | 3 ++-
 package/x11vnc/x11vnc.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11vnc/x11vnc.hash b/package/x11vnc/x11vnc.hash
index 86f41044db..ca0b48964c 100644
--- a/package/x11vnc/x11vnc.hash
+++ b/package/x11vnc/x11vnc.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  3e43bd875edc3c7f52a0d3676c4ec7de910fcd210240ee20b4522deb2bf84cff  x11vnc-0.9.15.tar.gz
+sha256  885e5b5f5f25eec6f9e4a1e8be3d0ac71a686331ee1cfb442dba391111bd32bd  x11vnc-0.9.16.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
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
