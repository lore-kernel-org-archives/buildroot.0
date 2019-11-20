From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 21:50:55 +0100
Subject: [Buildroot] [git commit] package/clamav: security bump version to
 0.102.1
Message-ID: <20191120204837.77FC38F3F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccca4f09547e6b59c65a975ff155f5b18cb4ced2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.clamav.net/pipermail/clamav-announce/2019/000043.html

Fixes CVE-2019-15961.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index aaebfd104c..72ce1b1c44 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 48fe188c46c793c2d0cb5c81c106e4690251aff6dc8aa6575dc688343291bee1  clamav-0.102.0.tar.gz
+sha256 0dbda8d0d990d068732966f13049d112a26dce62145d234383467c1d877dedd6  clamav-0.102.1.tar.gz
 sha256 0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256 d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256 dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 5caab1e0f6..a4059ae200 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.102.0
+CLAMAV_VERSION = 0.102.1
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
