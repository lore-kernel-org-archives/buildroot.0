From: Aleksander Morgado <aleksander@aleksander.es>
Date: Fri, 25 Aug 2017 14:30:56 +0200
Subject: [Buildroot] [PATCH] modem-manager: bump to version 1.6.8
Message-ID: <20170825123056.10730-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 2a2b96d12..83d45da5a 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  cdd5b4cb1e4d7643643a28ccbfc4bb354bfa9cb89a77ea160ebdf7926171c668  ModemManager-1.6.4.tar.xz
+sha256  ffc035c4bfeb07780c4580bb4488ade0ab1d197c3cdf89cb8ab36386cfb34376  ModemManager-1.6.8.tar.xz
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index c2999dc2e..d6e64f4a9 100644
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
-- 
2.14.1
