From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 13:07:55 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/dovecot: bump
 version to 2.2.30
Message-ID: <20180131123647.29E3687BC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b8514907d7eb97dad92cfb77d12416769c306d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bcded15090db5796126bf2298ce1b2304a544a5d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 46e7c5aa8a..8c6e14ea38 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 ccfa9ffb7eb91e9e87c21c108324b911250c9ffa838bffb64b1caafadcb0f388  dovecot-2.2.29.1.tar.gz
+sha256 126b07cbf4c313e8fc6df273282f60710b453a7a678f502fd45c2fa7192127f3  dovecot-2.2.30.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 36a6494895..876384f43f 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).29.1
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).30
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPLv2.1
