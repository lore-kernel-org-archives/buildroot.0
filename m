From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 23:23:09 +0100
Subject: [Buildroot] [git commit] libva: remove consecutive empty lines
Message-ID: <20180130222327.D31C888126@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5953cf07fed5fca71098bafcf094e543e4b73ae0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/50140040

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva/libva.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 5f9de903f4..8d1e27f270 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -17,7 +17,6 @@ LIBVA_CONF_OPTS = \
 	--enable-drm \
 	--with-drivers-path="/usr/lib/va"
 
-
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
 LIBVA_CONF_OPTS += --enable-x11
