From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:10:11 +0200
Subject: [Buildroot] [git commit] qt5base: fix typo in qmake.conf.in
Message-ID: <20180630160656.DDB3D83615@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7544295d30d3e2ce6e169d4033a2bf2d36f646d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A blank space is missing.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qmake.conf.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qmake.conf.in b/package/qt5/qt5base/qmake.conf.in
index d62ee7cebe..f14527aa7f 100644
--- a/package/qt5/qt5base/qmake.conf.in
+++ b/package/qt5/qt5base/qmake.conf.in
@@ -21,7 +21,7 @@ CONFIG                 += nostrip
 QMAKE_LIBS             += -lrt -lpthread -ldl
 QMAKE_CFLAGS_ISYSTEM   =
 
-# Architecturespecific configuration
+# Architecture specific configuration
 include(arch.conf)
 
 @EGLFS_DEVICE@
