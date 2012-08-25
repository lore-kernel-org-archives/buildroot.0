From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 17:19:26 +0200
Subject: [Buildroot] [git commit] connman: bump to version 1.6
Message-ID: <20120903200544.A587597235@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5cefe8a7edd38c06aedf2fe403e087d4061a180
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman/connman.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 726cb73..ed83ebc 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 #######################################################
 
-CONNMAN_VERSION = 1.4
+CONNMAN_VERSION = 1.6
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
 CONNMAN_INSTALL_STAGING = YES
