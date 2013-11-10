From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:56:37 +0100
Subject: [Buildroot] [git commit] libmodbus: bump version and change
	download location
Message-ID: <20131111001018.0F0D29A131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8639afc6f097337241d1ebb88bd7ae0b97606372
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license of libmodbus is LGPL v2.1 or later and the
licence of programs in tests directory is GPL v3. So
specify only LGPL v2.1.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodbus/libmodbus.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 8f93c2b..8aa3cd7 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.0.3
-LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
+LIBMODBUS_VERSION = 3.0.5
+LIBMODBUS_SITE = http://libmodbus.org/site_media/build/
+LIBMODBUS_LICENSE = LGPLv2.1+
+LIBMODBUS_LICENSE_FILES = COPYING.LESSER
 LIBMODBUS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
