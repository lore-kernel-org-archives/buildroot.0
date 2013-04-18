From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 18 Apr 2013 10:26:22 +0100
Subject: [Buildroot] [PATCH v2] monit: add license information
Message-ID: <1366277182-3380-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: Adjust license type in response to feedback from Peter Korsgaard
 and Arnout Vandecappelle.

 package/monit/monit.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index a8b6447..657f0f1 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -6,6 +6,8 @@
 
 MONIT_VERSION = 5.4
 MONIT_SITE = http://mmonit.com/monit/dist/
+MONIT_LICENSE = AGPLv3 with OpenSSL exception
+MONIT_LICENSE_FILES = COPYING
 
 MONIT_CONF_ENV = \
 	libmonit_cv_setjmp_available=yes \
-- 
1.7.10.4
