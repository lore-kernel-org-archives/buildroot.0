From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 13:08:07 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/dovecot: bump
 version to 2.2.30.2
Message-ID: <20180131123647.5C2A387BC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3c155461e76e683682f90f04e6e0b551c5d7665
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 64c476da409f60b6e78916c264978010891ca538)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index d53be6c0f2..354db440f1 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 9049db49f7ccd76850a17872896dfb8778676bab38454575f59bb39f16b083a4  dovecot-2.2.30.1.tar.gz
+sha256 f3dba79c1ceeaa9dd0633f648d3a607704bf3d0591e7d48168084c8add87189e  dovecot-2.2.30.2.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 98a400b04c..1d1aa86d7f 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).30.1
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).30.2
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPLv2.1
