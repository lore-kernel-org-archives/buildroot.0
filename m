From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 14 Sep 2014 17:34:15 -0300
Subject: [Buildroot] [PATCH] dos2unix: needs host-gettext
Message-ID: <1410726855-32136-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For msgfmt, fixes:
http://autobuild.buildroot.net/results/86a/86a104b4bfffa7426de93d63278b998d6dcce154/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dos2unix/dos2unix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 99bb742..fd531d4 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -6,7 +6,7 @@
 
 DOS2UNIX_VERSION = 7.0
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix/
-
+DOS2UNIX_DEPENDENCIES = host-gettext
 DOS2UNIX_LICENSE = BSD-2c
 DOS2UNIX_LICENSE_FILES = COPYING.txt
 
-- 
1.8.5.5
