From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 22:03:24 +0100
Subject: [Buildroot] [git commit] qt5base: enable C++11 if toolchain supports
Message-ID: <20150202214233.797F680812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fde2235efe3d5449d4f33e69490a85219455eae4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 90b5a6f..aaf4da0 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -195,7 +195,6 @@ define QT5BASE_CONFIGURE_CMDS
 		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
 		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 		-device-option EGLFS_PLATFORM_HOOKS_SOURCES="$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES)" \
-		-no-c++11 \
 		$(QT5BASE_CONFIGURE_OPTS) \
 	)
 endef
