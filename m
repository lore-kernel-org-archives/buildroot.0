From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:30:51 +0200
Subject: [Buildroot] [git commit] wiringpi: bump version to 2.32
Message-ID: <20161022133504.9C3CF8197C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ef0b0dabf904c281f131858372378a3ee387adb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change back to original download site

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wiringpi/wiringpi.hash |  2 +-
 package/wiringpi/wiringpi.mk   | 12 ++----------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/package/wiringpi/wiringpi.hash b/package/wiringpi/wiringpi.hash
index 65e1f9c..abddaf9 100644
--- a/package/wiringpi/wiringpi.hash
+++ b/package/wiringpi/wiringpi.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  00a4770c113a1a5f52480a30bcfad00d2087f42854f1791204af2e60ffe1ac8c  wiringpi-78b5c323b74de782df58ee558c249e4e4fadd25f.tar.gz
+sha256 0775e3bfa2df2131746c75d611ad354e5c884661be0d9de9fd786fc96f6ad918 wiringPi-2.32.tar.gz
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
index 87b1b6a..ce0819d 100644
--- a/package/wiringpi/wiringpi.mk
+++ b/package/wiringpi/wiringpi.mk
@@ -4,16 +4,8 @@
 #
 ################################################################################
 
-# original site is down (2016-06-03)
-#
-# WIRINGPI_VERSION = 2.31
-# WIRINGPI_SITE = git://git.drogon.net/wiringPi
-#
-# so change to alternative location (verifyed that commit 78b5c323
-# has the same content as local copy of wiringpi-2.31.tar.gz)
-#
-WIRINGPI_VERSION = 78b5c323b74de782df58ee558c249e4e4fadd25f
-WIRINGPI_SITE = $(call github,WiringPi,WiringPi,$(WIRINGPI_VERSION))
+WIRINGPI_VERSION = 2.32
+WIRINGPI_SITE = git://git.drogon.net/wiringPi
 
 WIRINGPI_LICENSE = LGPLv3+
 WIRINGPI_LICENSE_FILES = COPYING.LESSER
