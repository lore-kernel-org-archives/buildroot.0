From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  1 Aug 2012 08:06:58 +0100
Subject: [Buildroot] [PATCH v2] minicom: add license information
Message-ID: <1343804818-5775-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: License is GPL, not LGPL as claimed by v1 of this patch.

 package/minicom/minicom.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 7293f6a..6d0607f 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -6,6 +6,8 @@
 MINICOM_VERSION = 2.6.1
 MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.gz
 MINICOM_SITE = http://alioth.debian.org/frs/download.php/3700/
+MINICOM_LICENSE = GPLv2+
+MINICOM_LICENSE_FILES = COPYING
 
 # pkg-config is only used to check for liblockdev, which we don't have
 # in BR, so instead of adding host-pkg-config as a dependency, simply
-- 
1.7.9.5
