From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 27 Apr 2016 13:05:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/dovecot: bump version to 2.2.24
Message-ID: <1461755151-26467-1-git-send-email-bernd.kuhls@t-online.de>
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
index 480d839..33de82d 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	5d834be43fe8f6f61d9b0fb139bf1db2a4da313aeebd7bf09e4bf6bcb1c9e441	dovecot-2.2.23.tar.gz
+sha256	71c86891ea8deb5703d3dbbc3ea31ce2cbf7638f1aa395d9e8794d3ff7aebeb7	dovecot-2.2.24.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 21a9764..a9c0769 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).23
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).24
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPLv2.1
-- 
2.8.0.rc3
