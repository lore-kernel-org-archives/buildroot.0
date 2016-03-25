From: David Picard <davepiq@yahoo.fr>
Date: Fri, 25 Mar 2016 18:58:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/qwt : fix wrong makefile target.
Message-ID: <1458928685-16680-1-git-send-email-davepiq@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Picard <davepiq@yahoo.fr>
---
 package/qwt/qwt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 594b141..0bea5f3 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -12,7 +12,7 @@ ifeq ($(BR2_PACKAGE_QT),y)
 QWT_DEPENDENCIES = qt
 QWT_QMAKE = $(QT_QMAKE)
 else ifeq ($(BR2_PACKAGE_QT5),y)
-QWT_DEPENDENCIES += qt5
+QWT_DEPENDENCIES += qt5base
 QWT_QMAKE = $(QT5_QMAKE)
 endif
 
-- 
1.9.1
