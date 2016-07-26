From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 26 Jul 2016 16:47:43 +0200
Subject: [Buildroot] [PATCH 3/3] modem-manager: bump to version 1.6.0
In-Reply-To: <1469544463-19881-1-git-send-email-yegorslists@googlemail.com>
References: <1469544463-19881-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1469544463-19881-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

MUSL build was fixed in this release.

Fixes:
http://autobuild.buildroot.net/results/fcc/fcce95bd13407535bee336e34288b55142ae0bb5

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 5299c84..9e83488 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  abe6cdd515a774bcba3afdcdb1e504569801e79282ccdf26099f33cbb8731ba2  ModemManager-1.4.14.tar.xz
+sha256  a94f4657a8fa6835e2734fcc6edf20aa8c8d452f62299d7748541021c3eb2445  ModemManager-1.6.0.tar.xz
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 6d91afc..252292a 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.4.14
+MODEM_MANAGER_VERSION = 1.6.0
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
-- 
2.1.4
