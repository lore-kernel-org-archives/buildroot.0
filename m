From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 Feb 2014 16:28:37 +0100
Subject: [Buildroot] [git commit] ModemManager: bump to 1.2.0
Message-ID: <20140201190033.0CBC79C731@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1dc2e9a8317c132b4ec9cc7e714511ab61297722
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/modem-manager/modem-manager.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 248b770..a2d046d 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.0.0
+MODEM_MANAGER_VERSION = 1.2.0
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager/
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
