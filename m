From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:11:36 +0100
Subject: [Buildroot] [git commit] qt5webchannel: use
	QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES
Message-ID: <20161101151330.92C6E8181F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77be1aa5187f80fc02a55cb2173f3f1251043ca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
