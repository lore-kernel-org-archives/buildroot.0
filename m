From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 31 Jul 2012 09:16:21 +0100
Subject: [Buildroot] [PATCH] minicom: add license information
Message-ID: <1343722581-10112-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/minicom/minicom.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 7293f6a..e23429a 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -6,6 +6,8 @@
 MINICOM_VERSION = 2.6.1
 MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.gz
 MINICOM_SITE = http://alioth.debian.org/frs/download.php/3700/
+MINICOM_LICENSE = LGPLv2+
+MINICOM_LICENSE_FILES = COPYING
 
 # pkg-config is only used to check for liblockdev, which we don't have
 # in BR, so instead of adding host-pkg-config as a dependency, simply
-- 
1.7.9.5
