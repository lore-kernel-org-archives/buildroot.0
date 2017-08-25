From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Aug 2017 16:07:36 +0200
Subject: [Buildroot] [git commit] modem-manager: bump to version 1.6.8
Message-ID: <20170902130620.1F3AF8016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18d697960421715d18acfbf940b51353cad885fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 2a2b96d..83d45da 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  cdd5b4cb1e4d7643643a28ccbfc4bb354bfa9cb89a77ea160ebdf7926171c668  ModemManager-1.6.4.tar.xz
+sha256  ffc035c4bfeb07780c4580bb4488ade0ab1d197c3cdf89cb8ab36386cfb34376  ModemManager-1.6.8.tar.xz
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 1eea355..6459f87 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.6.4
+MODEM_MANAGER_VERSION = 1.6.8
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
