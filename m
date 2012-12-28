From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 16:47:23 -0300
Subject: [Buildroot] [PATCH 7/7] connman: bump to version 1.10
In-Reply-To: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356724043-8879-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.8.6
