From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 23:13:55 +0100
Subject: [Buildroot] [git commit] modem-manager: bump to version 1.4.4
Message-ID: <20150306221613.CEA9F81821@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09d512be1e6c29587dc3e83200208938c090377b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/modem-manager/modem-manager.hash |    2 +-
 package/modem-manager/modem-manager.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index eae148f..20376b2 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  07d332fbe6f45f788f740810951e04042aaf023bd5ecf8ef0b3a06e37703585d  ModemManager-1.4.2.tar.xz
+sha256  1bf88861259772dc81e864e2faccfff0590d41676451a128c5f4e73550dd14d8  ModemManager-1.4.4.tar.xz
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 349517d..a6e1b36 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.4.2
+MODEM_MANAGER_VERSION = 1.4.4
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
