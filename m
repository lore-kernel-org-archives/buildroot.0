From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:34:15 +0200
Subject: [Buildroot] [git commit] package/watchdog: drop AUTORECONF
Message-ID: <20200902161637.9E6E585EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46080111af0fd3730048a15fc0b7f739ad39dd44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream tarball provides an already generated configure script,
which works fine, so there's no need to AUTORECONF.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/watchdog/watchdog.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/watchdog/watchdog.mk b/package/watchdog/watchdog.mk
index b814fdc672..2699fb474f 100644
--- a/package/watchdog/watchdog.mk
+++ b/package/watchdog/watchdog.mk
@@ -6,7 +6,6 @@
 
 WATCHDOG_VERSION = 5.16
 WATCHDOG_SITE = http://downloads.sourceforge.net/sourceforge/watchdog
-WATCHDOG_AUTORECONF = YES
 WATCHDOG_LICENSE = GPL-2.0+
 WATCHDOG_LICENSE_FILES = COPYING
 # By default installs binaries in /usr/sbin/, but we want them in
