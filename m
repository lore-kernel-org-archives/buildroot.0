From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 30 Jul 2012 08:32:08 +0100
Subject: [Buildroot] [PATCH v2] libnfc: add license information
Message-ID: <1343633528-10335-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: License is LGPL, and not GPL as incorrectly claimed by v1 of this patch.

 package/libnfc/libnfc.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index ab062bb..08892b3 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -6,6 +6,8 @@
 LIBNFC_VERSION = 1446
 LIBNFC_SITE = http://libnfc.googlecode.com/svn/trunk/
 LIBNFC_SITE_METHOD = svn
+LIBNFC_LICENSE = LGPLv3+
+LIBNFC_LICENSE_FILES = COPYING
 LIBNFC_AUTORECONF = YES
 LIBNFC_INSTALL_STAGING = YES
 
-- 
1.7.9.5
