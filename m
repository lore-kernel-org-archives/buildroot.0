From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:43 +0100
Subject: [Buildroot] [PATCH 37/51] xbmc-addon-xvdr: Change comments on
	VERSION
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-37-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cset points actually to HEAD of the Gotham branch, change the
comment to reflect that.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
index a4d9624..d51d2c5 100644
--- a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
+++ b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-# This cset is on master. When a Gotham branch is made, we should
-# follow it, as incompatible changes in the plugins API can happen
-# on the master branch.
+# This cset is the HEAD of the xbmc-gotham master. It will need to change when
+# XBMC is updated.
 XBMC_ADDON_XVDR_VERSION = 82b5093ad33847f97a978cb620c9a87d2dbcf7eb
 XBMC_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(XBMC_ADDON_XVDR_VERSION))
 XBMC_ADDON_XVDR_LICENSE = GPLv2+
-- 
2.1.1
