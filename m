From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jan 2017 16:20:30 +0100
Subject: [Buildroot] [git commit] mpv: fix DEPENDENCIES typo
Message-ID: <20170103152906.663FD81DDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8425ec6fa7b28fe0bebe6e5f2495d9da40f0479a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/mpv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 1eb83e9..d719075 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -45,7 +45,7 @@ endif
 # GBM support is provided by mesa3d when EGL=y
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MPV_CONF_OPTS += --enable-gbm
-MPV_DEPENDENIES += mesa3d
+MPV_DEPENDENCIES += mesa3d
 else
 MPV_CONF_OPTS += --disable-gbm
 endif
