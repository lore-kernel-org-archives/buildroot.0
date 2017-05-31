From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 31 May 2017 07:54:57 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/dovecot: bump version to 2.2.30
Message-ID: <20170531055457.3890-1-bernd.kuhls@t-online.de>
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
index 46e7c5aa8..8c6e14ea3 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 ccfa9ffb7eb91e9e87c21c108324b911250c9ffa838bffb64b1caafadcb0f388  dovecot-2.2.29.1.tar.gz
+sha256 126b07cbf4c313e8fc6df273282f60710b453a7a678f502fd45c2fa7192127f3  dovecot-2.2.30.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 3f71f6898..ace8cf041 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).29.1
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).30
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1
-- 
2.11.0
