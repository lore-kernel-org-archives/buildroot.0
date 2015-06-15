From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jun 2015 23:42:28 +0200
Subject: [Buildroot] [git commit] package/modem-manager: bump to version
	1.4.8
Message-ID: <20150615214401.A5C75807EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f57ac06c6590b40a2862ebbe560fab116998b14d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/modem-manager/modem-manager.hash |    2 +-
 package/modem-manager/modem-manager.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 7ee5dc8..5935cba 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  0cedabf46310f8c56630b116944f54ee64369c76c2f35f5f460ca19a8bb5a5cd  ModemManager-1.4.6.tar.xz
+sha256  d951eaffbe513bcde54f90602c6c423a49593f656d6485ba95f6fcb4bc1e8003  ModemManager-1.4.8.tar.xz
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 3eeb475..9cd630c 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.4.6
+MODEM_MANAGER_VERSION = 1.4.8
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
