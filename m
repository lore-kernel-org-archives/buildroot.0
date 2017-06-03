From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Jun 2017 20:07:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/dovecot: bump version to 2.30.1
Message-ID: <20170603180732.19176-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 8c6e14ea3..d53be6c0f 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 126b07cbf4c313e8fc6df273282f60710b453a7a678f502fd45c2fa7192127f3  dovecot-2.2.30.tar.gz
+sha256 9049db49f7ccd76850a17872896dfb8778676bab38454575f59bb39f16b083a4  dovecot-2.2.30.1.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index ace8cf041..05d00525d 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).30
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).30.1
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1
-- 
2.11.0
