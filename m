From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Jan 2015 09:31:04 -0300
Subject: [Buildroot] [PATCH] openntpd: fix license info/file
Message-ID: <1421325064-18264-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openntpd/openntpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index c23b613..158ac85 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -7,7 +7,7 @@
 OPENNTPD_VERSION = 5.7p1
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
-OPENNTPD_LICENSE_FILES = LICENCE
+OPENNTPD_LICENSE_FILES = COPYING
 
 define OPENNTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/openntpd/S49ntp \
-- 
2.0.5
