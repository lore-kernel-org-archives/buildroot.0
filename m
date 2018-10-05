From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 22:33:07 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/clamav: security
 bump to 0.100.2
Message-ID: <20181005203211.972F78D6C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e28da8cd645771111136bc258f227577e8e9ebc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes CVE-2018-15378, CVE-2018-14680, CVE-2018-14681 & CVE-2018-14682:
http://lists.clamav.net/pipermail/clamav-announce/2018/000033.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bbd6fb9c2d9dd64e3e655ab9fac7be87bbd64ff3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 0cb8f51d87..390251fc24 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 84e026655152247de7237184ee13003701c40be030dd68e0316111049f58a59f  clamav-0.100.1.tar.gz
+sha256 4a2e4f0cd41e62adb5a713b4a1857c49145cd09a69957e6d946ecad575206dd6  clamav-0.100.2.tar.gz
 sha256 0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256 d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256 dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 9db90bddea..50990abad6 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.100.1
+CLAMAV_VERSION = 0.100.2
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
