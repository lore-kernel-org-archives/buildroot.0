From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  2 Jun 2015 23:11:35 +0200
Subject: [Buildroot] [PATCH 2/2] qt5cinex: fix license typo
In-Reply-To: <1433279495-5370-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1433279495-5370-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1433279495-5370-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/qt5cinex/qt5cinex.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index a79df7b..bfe14ce 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -15,7 +15,7 @@ QT5CINEX_SOURCE = Qt5_CinematicExperience_$(QT5CINEX_HD)$(QT5CINEX_VERSION).tgz
 QT5CINEX_DEPENDENCIES = qt5base qt5declarative
 
 QT5CINEX_LICENSE = CC-BY-3.0
-QT5CINEX_LICENSE_FILE = README
+QT5CINEX_LICENSE_FILES = README
 
 define QT5CINEX_CONFIGURE_CMDS
 	cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake
-- 
1.9.1
