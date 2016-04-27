From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:15:59 +0200
Subject: [Buildroot] [git commit] package/dovecot: bump version to 2.2.24
Message-ID: <20160427201606.E810B81D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f235bc76434ad1b55d7ca2cbb0b7c2bc209bb23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
