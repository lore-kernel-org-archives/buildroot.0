From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sat, 30 Jun 2018 02:29:27 -0400
Subject: [Buildroot] [PATCH] qt5base: fix typo in qmake.conf.in
Message-ID: <20180630062927.29725-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A blank space is missing.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
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
-- 
2.11.0
