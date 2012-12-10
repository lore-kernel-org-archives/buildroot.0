From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 22:24:08 +0100
Subject: [Buildroot] [git commit] bump connman version to 1.9
Message-ID: <20121210212803.92AD799949@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36f96dbb7816ddeaa7f0a588f0a54ad8fd7a0ee5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A quick patch to bump connman's version to 1.9

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/connman.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
