From: Matt Kraai <kraai@ftbfs.org>
Date: Tue,  1 Nov 2016 07:55:35 -0700
Subject: [Buildroot] [PATCH 2/2] qt5websockets: use
	QT5WEBSOCKETS_INSTALL_TARGET_EXAMPLES
In-Reply-To: <20161101145535.24959-1-kraai@ftbfs.org>
References: <20161101145535.24959-1-kraai@ftbfs.org>
Message-ID: <20161101145535.24959-2-kraai@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
---
 package/qt5/qt5websockets/qt5websockets.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index f1200c2..609b68e 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -56,6 +56,7 @@ endif
 define QT5WEBSOCKETS_INSTALL_TARGET_CMDS
 	$(QT5WEBSOCKETS_INSTALL_TARGET_LIBS)
 	$(QT5WEBSOCKETS_INSTALL_TARGET_QMLS)
+	$(QT5WEBSOCKETS_INSTALL_TARGET_EXAMPLES)
 endef
 
 $(eval $(generic-package))
-- 
2.10.2
