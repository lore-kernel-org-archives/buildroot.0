From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 20:38:00 +0100
Subject: [Buildroot] [git commit] cmake: add license informations
Message-ID: <20130120202430.5A1E37FDE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63bd72508bdd6be18a91c0864323a6d8df94be10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cmake/cmake.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
