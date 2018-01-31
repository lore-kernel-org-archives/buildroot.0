From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 13:08:22 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/dovecot: bump
 version to 2.2.31
Message-ID: <20180131123647.703038813E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96202e700718d497aa2b9e214467106d66c6caf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5723251f1892c0ffdf36f86d2574d3ba7dee3084)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 354db440f1..184745b394 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 f3dba79c1ceeaa9dd0633f648d3a607704bf3d0591e7d48168084c8add87189e  dovecot-2.2.30.2.tar.gz
+sha256 034be40907748128d65088a4f59789b2f99ae7b33a88974eae0b6a68ece376a1  dovecot-2.2.31.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 1d1aa86d7f..2378b9cc63 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).30.2
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).31
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPLv2.1
