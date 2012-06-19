From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 19 Jun 2012 18:59:03 +0200
Subject: [Buildroot] [PATCH 2/2] qt: bump to 4.8.2
In-Reply-To: <1340125143-8683-1-git-send-email-luca@lucaceresoli.net>
References: <1340125143-8683-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1340125143-8683-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also switch to the new upstream URL.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/qt/qt.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index ff9f4ca..6b1be83 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -11,9 +11,9 @@
 #
 ######################################################################
 
-QT_VERSION = 4.8.1
+QT_VERSION = 4.8.2
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
-QT_SITE    = http://get.qt.nokia.com/qt/source
+QT_SITE    = http://releases.qt-project.org/qt4/source
 QT_DEPENDENCIES = host-pkg-config
 QT_INSTALL_STAGING = YES
 
-- 
1.7.9.5
