From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon,  2 Jan 2017 13:11:01 -0300
Subject: [Buildroot] [PATCH] mpv: fix DEPENDENCIES typo
Message-ID: <20170102161101.10221-1-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.10.2
