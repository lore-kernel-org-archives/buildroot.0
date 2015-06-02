From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 23:32:28 +0200
Subject: [Buildroot] [git commit] qt5cinex: fix license typo
Message-ID: <20150602213355.CBA907FA13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0606cf10be3ed9934c90e8c752fe931918f55d15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5cinex/qt5cinex.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
