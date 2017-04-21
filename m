From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 21 Apr 2017 11:24:51 -0400
Subject: [Buildroot] [PATCH 6/7] qt5.mk: add header
In-Reply-To: <20170421152452.11236-1-aduskett@codeblue.com>
References: <20170421152452.11236-1-aduskett@codeblue.com>
Message-ID: <20170421152452.11236-6-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
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
-- 
2.9.3
