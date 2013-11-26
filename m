From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Nov 2013 12:30:38 +0100
Subject: [Buildroot] [git commit] sunxi-mali,
	ti-gfx: add missing dollar sign in egl.pc
Message-ID: <20131126113735.42E3A9BD7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2c32b81dd4dcd9ece6caeccef9c10dd9a03049c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-mali/egl.pc |    2 +-
 package/ti-gfx/egl.pc     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali/egl.pc b/package/sunxi-mali/egl.pc
index 56e3990..b062ad1 100644
--- a/package/sunxi-mali/egl.pc
+++ b/package/sunxi-mali/egl.pc
@@ -8,5 +8,5 @@ Description: ARM Mali implementation of EGL
 Version: 1.4
 Requires:
 Libs: -L${libdir} -lEGL -lGLESv2 -lUMP
-Cflags: -I{includedir}/EGL/ -I${includedir}
+Cflags: -I${includedir}/EGL/ -I${includedir}
 
diff --git a/package/ti-gfx/egl.pc b/package/ti-gfx/egl.pc
index 5ae5a9d..223fb04 100644
--- a/package/ti-gfx/egl.pc
+++ b/package/ti-gfx/egl.pc
@@ -8,4 +8,4 @@ Description: TI Graphics SDK implementation of EGL
 Version: 1.9.2188537
 Requires:
 Libs: -L${libdir} -lEGL -lGLESv2 -lIMGegl
-Cflags: -I{includedir}/EGL/ -I${includedir}
+Cflags: -I${includedir}/EGL/ -I${includedir}
