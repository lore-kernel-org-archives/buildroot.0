From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 13 Nov 2012 12:56:31 +0000
Subject: [Buildroot] [PATCH] libnfc: bump version
Message-ID: <1352811392-5711-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Note that libnfc has also switched from Subversion to Git.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libnfc/libnfc.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index c343551..b9ff583 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -3,9 +3,9 @@
 # libnfc
 #
 #############################################################
-LIBNFC_VERSION = 1446
-LIBNFC_SITE = http://libnfc.googlecode.com/svn/trunk/
-LIBNFC_SITE_METHOD = svn
+LIBNFC_VERSION = fda8d60ce062
+LIBNFC_SITE = http://libnfc.googlecode.com/git/
+LIBNFC_SITE_METHOD = git
 LIBNFC_LICENSE = LGPLv3+
 LIBNFC_LICENSE_FILES = COPYING
 LIBNFC_AUTORECONF = YES
-- 
1.7.10.4
