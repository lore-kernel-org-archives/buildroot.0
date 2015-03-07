From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 11:09:13 +0100
Subject: [Buildroot] [git commit] package/mesa3d-headers: bump version to
	10.4.6
Message-ID: <20150307100920.1A57E804F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8942756e201c7ae3eecd2811474d456b2822e134
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index e20859e..5e113ce 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 10.4.5
+MESA3D_HEADERS_VERSION = 10.4.6
 MESA3D_HEADERS_SOURCE = MesaLib-$(MESA3D_HEADERS_VERSION).tar.bz2
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
