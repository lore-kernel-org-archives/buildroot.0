From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 16 Mar 2015 22:24:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/dovecot: bump version to 2.2.16
Message-ID: <1426541049-994-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index a60dd4d..e8d1edb 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).15
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).16
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPLv2.1
-- 
1.7.10.4
