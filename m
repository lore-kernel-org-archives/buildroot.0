From: Matt Kraai <kraai@ftbfs.org>
Date: Tue,  1 Nov 2016 07:55:34 -0700
Subject: [Buildroot] [PATCH 1/2] qt5webchannel: use
	QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES
Message-ID: <20161101145535.24959-1-kraai@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
---
 package/qt5/qt5webchannel/qt5webchannel.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 9e94914..3865ced 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -62,6 +62,7 @@ define QT5WEBCHANNEL_INSTALL_TARGET_CMDS
 	$(QT5WEBCHANNEL_INSTALL_TARGET_LIBS)
 	$(QT5WEBCHANNEL_INSTALL_TARGET_QMLS)
 	$(QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT)
+	$(QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES)
 endef
 
 $(eval $(generic-package))
-- 
2.10.2
