From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 27 Jun 2017 06:38:08 +0200
Subject: [Buildroot] [PATCH 1/2] package/dovecot: bump version to 2.2.31
Message-ID: <20170627043809.30458-1-bernd.kuhls@t-online.de>
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
index 354db440f..184745b39 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 f3dba79c1ceeaa9dd0633f648d3a607704bf3d0591e7d48168084c8add87189e  dovecot-2.2.30.2.tar.gz
+sha256 034be40907748128d65088a4f59789b2f99ae7b33a88974eae0b6a68ece376a1  dovecot-2.2.31.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index a23d57df5..4cc6ae4de 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).30.2
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).31
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1
-- 
2.11.0
