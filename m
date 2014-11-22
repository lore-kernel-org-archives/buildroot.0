From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:47:51 +0100
Subject: [Buildroot] [git commit] tvheadend: indentation cleanup
Message-ID: <20141201104837.B431C7FFF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7661580ff2c4e63e3420490b612ab5d7b9486a0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

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
 
