From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 20:22:32 +0100
Subject: [Buildroot] [PATCH 3/8] cmake: add license informations
In-Reply-To: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358709757-1929-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/cmake.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index e2bc31f..6836172 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -1,5 +1,13 @@
+#############################################################
+#
+# cmake
+#
+#############################################################
+
 CMAKE_VERSION = 2.8.9
 CMAKE_SITE = http://www.cmake.org/files/v2.8/
+CMAKE_LICENSE = BSD-3c
+CMAKE_LICENSE_FILES = Copyright.txt
 
 define HOST_CMAKE_CONFIGURE_CMDS
  (cd $(@D); \
-- 
1.7.9.5
