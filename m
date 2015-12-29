From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 29 Dec 2015 18:10:34 +0100
Subject: [Buildroot] [PATCH 3/3] qt5webchannel: indentation cleanup
In-Reply-To: <1451409034-17537-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1451409034-17537-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1451409034-17537-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
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
 
-- 
1.9.1
