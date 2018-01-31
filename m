From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 13:08:01 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/dovecot: bump
 version to 2.30.1
Message-ID: <20180131123647.4A65387BC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd5d1db6608b8b92ff47d81eae6c10673a450703
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 083e9c64f052a2dc712bc9d3834a9b9b8e8671c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 8c6e14ea38..d53be6c0f2 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 126b07cbf4c313e8fc6df273282f60710b453a7a678f502fd45c2fa7192127f3  dovecot-2.2.30.tar.gz
+sha256 9049db49f7ccd76850a17872896dfb8778676bab38454575f59bb39f16b083a4  dovecot-2.2.30.1.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 876384f43f..98a400b04c 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).30
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).30.1
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPLv2.1
