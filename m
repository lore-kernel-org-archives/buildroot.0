From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:11:42 +0100
Subject: [Buildroot] [git commit] qt5websockets: use
	QT5WEBSOCKETS_INSTALL_TARGET_EXAMPLES
Message-ID: <20161101151330.A00F88181F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=437d90f03796c56d7b2709c0af4e7d1f986d0202
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
