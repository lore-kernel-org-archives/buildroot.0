From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 09:55:32 +0200
Subject: [Buildroot] [git commit] dbus: add license information
Message-ID: <20130511075917.64F849A091@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06e5c7a11136c7a2eaad458f8f1dcb77dddc1e22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus/dbus.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index ec42874..3aa1345 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,8 +3,11 @@
 # dbus
 #
 #############################################################
+
 DBUS_VERSION = 1.4.24
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
+DBUS_LICENSE = AFLv2.1 GPLv2+
+DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
 
 DBUS_DEPENDENCIES = host-pkgconf
