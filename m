From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 18:29:41 -0300
Subject: [Buildroot] [PATCH 01/10] xz: add license information
Message-ID: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xz/xz.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index e00c91b..8ff3c83 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -3,11 +3,14 @@
 # xz-utils
 #
 #############################################################
+
 XZ_VERSION = 5.0.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+XZ_LICENSE = GPLv2+ GPLv3+ LGPLv2.1+
+XZ_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.12.4
