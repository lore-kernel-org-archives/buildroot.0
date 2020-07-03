From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Fri,  3 Jul 2020 14:12:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5: fix check-package warnings
Message-ID: <1593778322-13727-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

https://gitlab.com/buildroot.org/buildroot/-/jobs/622129163

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/qt5/qt5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 4fa687f..a2572be 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -21,7 +21,7 @@ endef
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define QT5_QT_CONF_FIXUP
-        $(QT5_INSTALL_QT_CONF)
+	$(QT5_INSTALL_QT_CONF)
 endef
 endif
 
-- 
2.7.4
