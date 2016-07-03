From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:24:02 +0200
Subject: [Buildroot] [git commit] dos2unix: remove empty host dependencies
	definition
Message-ID: <20160703082409.55E24800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=781500c380312cc125d089b5b4cbef769a9ef11c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dos2unix/dos2unix.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 82fa26f..df2094e 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -9,7 +9,6 @@ DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2c
 DOS2UNIX_LICENSE_FILES = COPYING.txt
 DOS2UNIX_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-HOST_DOS2UNIX_DEPENDENCIES =
 
 ifeq ($(BR2_ENABLE_LOCALE),y)
 DOS2UNIX_DEPENDENCIES += host-gettext
