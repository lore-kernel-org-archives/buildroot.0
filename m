From: Rodrigo Rebello <rprebello@gmail.com>
Date: Wed,  4 Nov 2015 11:40:38 -0200
Subject: [Buildroot] [PATCH 1/1] irssi: change IRSSI_SITE back to original
	url
Message-ID: <1446644438-18173-1-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The official site is now back online.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 package/irssi/irssi.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 6857a11..2207daf 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -6,9 +6,7 @@
 
 IRSSI_VERSION = 0.8.17
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.bz2
-# Official web site is down
-# IRSSI_SITE = http://irssi.org/files
-IRSSI_SITE = http://pkgs.fedoraproject.org/repo/pkgs/irssi/$(IRSSI_SOURCE)/ecf64be47978d89a742b435a81cb47db
+IRSSI_SITE = http://irssi.org/files
 IRSSI_LICENSE = GPLv2+
 IRSSI_LICENSE_FILES = COPYING
 IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses
-- 
2.1.4
