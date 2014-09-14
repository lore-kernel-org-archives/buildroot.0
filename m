From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Sep 2014 23:00:23 +0200
Subject: [Buildroot] [git commit] dos2unix: needs host-gettext
Message-ID: <20140914211527.E00EA9D62B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6662bd3e2a97db492de839ca99aedb76243e20e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For msgfmt, fixes:
http://autobuild.buildroot.net/results/86a/86a104b4bfffa7426de93d63278b998d6dcce154/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dos2unix/dos2unix.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
