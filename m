From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:13:24 -0400
Subject: [Buildroot] [PATCH 16/17] socat: add license info
Message-ID: <1344716004-9960-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/socat/socat.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 9a5234d..f10a836 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -7,6 +7,8 @@
 SOCAT_VERSION = 2.0.0-b5
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download/
+SOCAT_LICENSE = GPLv2
+SOCAT_LICENSE_FILES = COPYING
 SOCAT_CONF_ENV = sc_cv_termios_ispeed=no \
 		 sc_cv_sys_crdly_shift=9 \
 		 sc_cv_sys_tabdly_shift=11 \
-- 
1.7.9.5
