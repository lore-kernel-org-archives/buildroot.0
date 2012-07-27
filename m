From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 27 Jul 2012 13:38:36 +0100
Subject: [Buildroot] [PATCH] libnfc: add license information
Message-ID: <1343392716-11560-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libnfc/libnfc.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index ab062bb..9a03d00 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -6,6 +6,8 @@
 LIBNFC_VERSION = 1446
 LIBNFC_SITE = http://libnfc.googlecode.com/svn/trunk/
 LIBNFC_SITE_METHOD = svn
+LIBNFC_LICENSE = GPLv3+
+LIBNFC_LICENSE_FILES = COPYING
 LIBNFC_AUTORECONF = YES
 LIBNFC_INSTALL_STAGING = YES
 
-- 
1.7.9.5
