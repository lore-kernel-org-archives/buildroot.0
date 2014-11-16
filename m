From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 13:26:27 +0100
Subject: [Buildroot] [PATCH 3/3] package/tvheadend: Remove tabs
In-Reply-To: <1416140787-18038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416140787-18038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1416140787-18038-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index b0038c8..ac3a557 100644
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
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--prefix=/usr \
+		--arch="$(ARCH)" \
+		--cpu="$(BR2_GCC_TARGET_CPU)" \
+		--python="$(HOST_DIR)/usr/bin/python" \
+		--disable-dvbscan \
+		--enable-bundle \
+		--disable-libffmpeg_static \
+		$(TVHEADEND_CONF_OPTS) \
 	)
 endef
 
-- 
1.7.10.4
