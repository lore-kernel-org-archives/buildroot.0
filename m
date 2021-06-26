From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jun 2021 15:11:56 +0200
Subject: [Buildroot] [git commit] package/modem-manager: bump version to
 1.16.6
Message-ID: <20210626124017.876198E069@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9cb34313e342e65a80e2cde18d44884dc10890e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Fischer <mf@go-sys.de>
Reviewed-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 39cdf8cc84..b840020f38 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  167e60b26fa05887f87a0b3fb54143d7845e6e4d8c2f2dd93afac059f41e7edf  ModemManager-1.16.4.tar.xz
+sha256  2a90b6260f66d3135609d62667ada73416694d717e7fd9b73223e3703a499617  ModemManager-1.16.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 9377d9a9f5..7cd5be7ef1 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.16.4
+MODEM_MANAGER_VERSION = 1.16.6
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
