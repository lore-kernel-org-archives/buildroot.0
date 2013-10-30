From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 22:50:29 +0100
Subject: [Buildroot] [PATCH] pkgconf: fix upstream URL
Message-ID: <1383169829-31827-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upstream URL has changed to
http://rabbit.dereferenced.org/~nenolod/distfiles/, updated the
Buildroot pkgconf package accordingly.

Fixes #6638.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reported-by: <masrur.macece@gmail.com>
Cc: <masrur.macece@gmail.com>
---
 package/pkgconf/pkgconf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index b489699..3ff093f 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PKGCONF_VERSION = 0.8.9
-PKGCONF_SITE = http://tortois.es/~nenolod/distfiles
+PKGCONF_SITE = http://rabbit.dereferenced.org/~nenolod/distfiles/
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
-- 
1.8.1.2
