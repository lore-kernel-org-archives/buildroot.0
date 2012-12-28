From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 22:26:51 +0100
Subject: [Buildroot] [git commit] connman: bump to version 1.10
Message-ID: <20121228213151.BE4A89A4EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fcb68511e317650b028a911b8fcd7bd241fd89b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/connman.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 2c376c9..73ea70d 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,10 +4,12 @@
 #
 #######################################################
 
-CONNMAN_VERSION = 1.9
+CONNMAN_VERSION = 1.10
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
 CONNMAN_INSTALL_STAGING = YES
+CONNMAN_LICENSE = GPLv2
+CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CONF_OPT += --localstatedir=/var \
 	$(if $(BR2_PACKAGE_CONNMAN_THREADS),--enable-threads,--disable-threads)		\
 	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
