From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 12:34:55 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/clamav: security
 bump version to 0.101.3
Message-ID: <20190902103120.6F6CC88F07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cf102235a3eef721f50f7ab11ee40c2247adc2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Release notes:
https://blog.clamav.net/2019/08/clamav-01013-security-patch-release-and.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9537db0d82ec4f869fb84cd68315dd8d96f0c899)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 4b61cd9654..ee77045f28 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 0a12ebdf6ff7a74c0bde2bdc2b55cae33449e6dd953ec90824a9e01291277634  clamav-0.101.2.tar.gz
+sha256 68d42aac4a9cbde293288533a9a3c3d55863de38f2b8707c1ef2d987b1260338  clamav-0.101.3.tar.gz
 sha256 0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256 d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256 dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 5bb0aa09d9..698094d44a 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.101.2
+CLAMAV_VERSION = 0.101.3
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
