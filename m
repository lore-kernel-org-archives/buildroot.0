From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 19 Nov 2014 14:43:56 +0100
Subject: [Buildroot] [PATCH v2 next] tvheadend: indentation cleanup
Message-ID: <1416404636-17197-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
Changes v1 -> v2:
 - rebase to next
 - reword Sob of Bernd

 package/tvheadend/tvheadend.mk |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index b0038c8..10c9201 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -35,18 +35,18 @@ endif
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
 
 define TVHEADEND_CONFIGURE_CMDS
-	(cd $(@D);				\
-	 $(TARGET_CONFIGURE_OPTS)		\
-	 $(TARGET_CONFIGURE_ARGS)		\
-	 ./configure				\
-	 --prefix=/usr				\
-	 --arch="$(ARCH)"			\
-	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
-	 --python="$(HOST_DIR)/usr/bin/python"	\
-	 --disable-dvbscan			\
-	 --enable-bundle			\
-	 --disable-libffmpeg_static		\
-	 $(TVHEADEND_CONF_OPTS)			\
+	(cd $(@D);						\
+		$(TARGET_CONFIGURE_OPTS)			\
+		$(TARGET_CONFIGURE_ARGS)			\
+		./configure					\
+			--prefix=/usr				\
+			--arch="$(ARCH)"			\
+			--cpu="$(BR2_GCC_TARGET_CPU)"		\
+			--python="$(HOST_DIR)/usr/bin/python"	\
+			--disable-dvbscan			\
+			--enable-bundle				\
+			--disable-libffmpeg_static		\
+			$(TVHEADEND_CONF_OPTS)			\
 	)
 endef
 
-- 
1.7.9.5
