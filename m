From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 15 Apr 2013 08:40:07 +0100
Subject: [Buildroot] [PATCH] monit: add license information
Message-ID: <1366011607-31433-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/monit/monit.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index a8b6447..0d24e05 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -6,6 +6,8 @@
 
 MONIT_VERSION = 5.4
 MONIT_SITE = http://mmonit.com/monit/dist/
+MONIT_LICENSE = AGPLv3+
+MONIT_LICENSE_FILES = COPYING
 
 MONIT_CONF_ENV = \
 	libmonit_cv_setjmp_available=yes \
-- 
1.7.10.4
