From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:50:52 +0200
Subject: [Buildroot] [git commit] package/qt5: add comment header
Message-ID: <20170422135133.09D258223B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edc2d7b0a4d0af8f5456310da106c1d26b50ab48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 9e77ce3..5c7af39 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# qt5
+#
+################################################################################
+
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.8
 QT5_VERSION = $(QT5_VERSION_MAJOR).0
