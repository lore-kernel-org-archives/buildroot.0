From: Gary Coulbourne <bear@bears.org>
Date: Fri, 7 Dec 2012 12:04:37 -0500
Subject: [Buildroot] bump connman version to 1.9
Message-ID: <CAEnpE0zToiU8Q5CnXxPCid5EiXHs4m4e0MiHJj--wmi-u1stkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A quick patch to bump connman's version to 1.9

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 2c04cdd..2c376c9 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 #######################################################

-CONNMAN_VERSION = 1.8
+CONNMAN_VERSION = 1.9
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
 CONNMAN_INSTALL_STAGING = YES
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121207/88596348/attachment.html>
