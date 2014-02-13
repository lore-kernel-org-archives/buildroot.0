From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2014 23:18:27 +0100
Subject: [Buildroot] [git commit branch/next] dbus: bump version to 1.6.8
Message-ID: <20140213223017.C03919C9E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2be5638061caf256df64d68dd016e6ca8916a0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Cc: Gary Coulbourne <bear@bears.org>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 560f63e..74e2041 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.4.26
+DBUS_VERSION = 1.6.8
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
