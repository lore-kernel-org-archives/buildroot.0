From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Thu, 22 Jan 2015 14:37:59 +0200
Subject: [Buildroot] [PATCH v2 3/3] qt5base: enable C++11 if toolchain
	supports
In-Reply-To: <1421930279-3694-1-git-send-email-fatih.asici@gmail.com>
References: <1421930279-3694-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1421930279-3694-3-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 1 -
 1 file changed, 1 deletion(-)

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
-- 
1.9.1
