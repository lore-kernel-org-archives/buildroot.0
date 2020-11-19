From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:56:21 +0100
Subject: [Buildroot] [git commit branch/next] package/qt5/qt5base: fix typo
 for syslog support
Message-ID: <20201119214232.C781D82905@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90b9f1f881b0eb0225da15177e486a5dbd986b8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix typo from 109df4deba86839704d902204d130714e32df0fa that added this
option.

Signed-off-by: Jeff Zignego <jzignego@hedcontrols.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index fa92625738..4cd5980f0b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -255,7 +255,7 @@ QT5BASE_CONFIGURE_OPTS += -no-journald
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_SYSLOG),y)
-QT5BASE_CONIGURE_OPTS += -syslog
+QT5BASE_CONFIGURE_OPTS += -syslog
 else
 QT5BASE_CONFIGURE_OPTS += -no-syslog
 endif
