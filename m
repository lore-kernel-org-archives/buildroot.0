From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 11:12:11 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/clamav: security
 bump version to 0.102.4
Message-ID: <20200722090921.9B5FF7FF0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f231091c480ea2fb4e5edaaffcc75665c46bb58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Release notes:
https://blog.clamav.net/2020/07/clamav-01024-security-patch-released.html

Fixes CVE-2020-3481, CVE-2020-3327 & CVE-2020-3350.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a5beb29820a17137277eb12dfb7e5f106694addb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index f98dc6b320..b15460cecc 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ed3050c4569989ee7ab54c7b87246b41ed808259632849be0706467442dc0693  clamav-0.102.3.tar.gz
+sha256  eebd426a68020ecad0d2084b8c763e6898ccfd5febcae833d719640bb3ff391b  clamav-0.102.4.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index eec18fcc02..358228b861 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.102.3
+CLAMAV_VERSION = 0.102.4
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
