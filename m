From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Feb 2012 11:50:36 +0100
Subject: [Buildroot] [git commit] libmodbus: bump to 3.0.2
Message-ID: <20120207105047.8491B909C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4baff8bb2266f5dd2bdd84ee9244ca4f591675a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmodbus/libmodbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index ab134fd..4dcfe23 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -3,7 +3,7 @@
 # libmodbus
 #
 #############################################################
-LIBMODBUS_VERSION = 3.0.1
+LIBMODBUS_VERSION = 3.0.2
 LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
 LIBMODBUS_SOURCE = libmodbus-$(LIBMODBUS_VERSION).tar.gz
 LIBMODBUS_INSTALL_STAGING = YES
