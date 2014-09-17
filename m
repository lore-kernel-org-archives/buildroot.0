From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Sep 2014 15:16:11 +0200
Subject: [Buildroot] [git commit] dbus: security bump to version 1.8.8
Message-ID: <20140917132008.78CFC9D6C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6afb21f4554dda6c61b5849400820edb7de71b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-3635 - Buffer access with incorrect length value
CVE-2014-3636 - Allocation of file descriptors or handles
without limits or throttling
CVE-2014-3637 - Missing release of file descriptor or handle after
effective lifetime
CVE-2014-3638 - Algorithmic complexity
CVE-2014-3639 - Allocation of file descriptors or handles without
limits or throttling

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 63cec6e..3f29a30 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.8.6
+DBUS_VERSION = 1.8.8
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
