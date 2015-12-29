From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 19:05:10 +0100
Subject: [Buildroot] [git commit] qt5webchannel: indentation cleanup
Message-ID: <20151229180550.E66DC826EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42289cd2474263f8861cb10d5ba0ab049e98769e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5webchannel/qt5webchannel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index bd4257f..6ceb59e 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -36,7 +36,7 @@ define QT5WEBCHANNEL_INSTALL_STAGING_CMDS
 endef
 
 define QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
-        $(INSTALL) -m 0644 -D $(@D)/src/webchannel/qwebchannel.js \
+	$(INSTALL) -m 0644 -D $(@D)/src/webchannel/qwebchannel.js \
 		$(TARGET_DIR)/var/www/qwebchannel.js
 endef
 
