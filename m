From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 11:49:50 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] qt5base: fix typo in
 qmake.conf.in
Message-ID: <20180719094628.D58797FFA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=925031909db657e88b3f60d9e07ccec85fcc8ae6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

A blank space is missing.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7544295d30d3e2ce6e169d4033a2bf2d36f646d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
