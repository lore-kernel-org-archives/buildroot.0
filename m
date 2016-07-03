From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Jul 2016 10:58:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/dovecot: bump version to 2.2.25
Message-ID: <1467536329-25352-1-git-send-email-bernd.kuhls@t-online.de>
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
index 33de82d..0f67f0e 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	71c86891ea8deb5703d3dbbc3ea31ce2cbf7638f1aa395d9e8794d3ff7aebeb7	dovecot-2.2.24.tar.gz
+sha256	d8d9f32c846397f7c22749a84c5cf6f59c55ff7ded3dc9f07749a255182f9667	dovecot-2.2.25.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index a9c0769..31c62d3 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).24
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).25
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPLv2.1
-- 
2.8.1
