From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:35 +0100
Subject: [Buildroot] [PATCH 01/30] autoconf: add license info
Message-ID: <1352804764-24026-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/autoconf/autoconf.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 0cb50db..8807c10 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -7,6 +7,9 @@
 AUTOCONF_VERSION = 2.68
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
+AUTOCONF_LICENSE = GPLv3+ with exceptions
+AUTOCONF_LICENSE_FILES = COPYINGv3 COPYING.EXCEPTION
+
 AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 		    ac_cv_prog_gnu_m4_gnu=no
 
-- 
1.7.10.4
