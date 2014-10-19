From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 18:54:30 +0200
Subject: [Buildroot] [RFC/PATCH v4 06/12] package/xbmc-addon-xvdr: Bump
	version for Helix-compatibility
In-Reply-To: <1413737676-25455-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413737676-25455-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413737676-25455-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
index 16f3a0d..7e6ca4b 100644
--- a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
+++ b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-# This cset is on master. When a Gotham branch is made, we should
+# This cset is on master. When a Helix branch is made, we should
 # follow it, as incompatible changes in the plugins API can happen
 # on the master branch.
-XBMC_ADDON_XVDR_VERSION = 82b5093ad33847f97a978cb620c9a87d2dbcf7eb
+XBMC_ADDON_XVDR_VERSION = 2bf2563c801684e0ee2d08ba4ea57acbdbea5750
 XBMC_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(XBMC_ADDON_XVDR_VERSION))
 XBMC_ADDON_XVDR_LICENSE = GPLv2+
 XBMC_ADDON_XVDR_LICENSE_FILES = COPYING
-- 
1.7.10.4
