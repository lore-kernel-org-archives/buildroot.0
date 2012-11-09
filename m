From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  9 Nov 2012 11:36:05 +0000
Subject: [Buildroot] [PATCH] autoconf: add license information
Message-ID: <1352460965-17114-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/autoconf/autoconf.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 0cb50db..9530ee6 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -6,6 +6,8 @@
 
 AUTOCONF_VERSION = 2.68
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
+AUTOCONF_LICENSE = GPLv3+ with exceptions
+AUTOCONF_LICENSE_FILES = COPYINGv3 COPYING.EXCEPTION
 
 AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 		    ac_cv_prog_gnu_m4_gnu=no
-- 
1.7.10.4
