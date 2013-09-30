From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 30 Sep 2013 19:19:46 +0100
Subject: [Buildroot] [PATCH] monit: bump version to 5.6
Message-ID: <1380565186-19702-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/monit/monit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index e2847fc..ec7c95d 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.4
+MONIT_VERSION = 5.6
 MONIT_SITE = http://mmonit.com/monit/dist/
 MONIT_LICENSE = AGPLv3 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
-- 
1.8.1.2
