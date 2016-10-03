From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Oct 2016 13:14:55 +0200
Subject: [Buildroot] [git commit] modem-manager: bump to version 1.6.2
Message-ID: <20161003111634.E08377FAC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c615ecffda399d6a4564bebae24e1b43b9b219aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/modem-manager/modem-manager.hash | 4 ++--
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 9e83488..481f7dd 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  a94f4657a8fa6835e2734fcc6edf20aa8c8d452f62299d7748541021c3eb2445  ModemManager-1.6.0.tar.xz
+# Locally computed
+sha256  e4544398d9c166f8e13fe7c97149f262ad1fb48af980e0d4f9c34013920c6393  ModemManager-1.6.2.tar.xz
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 252292a..c74c224 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.6.0
+MODEM_MANAGER_VERSION = 1.6.2
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
