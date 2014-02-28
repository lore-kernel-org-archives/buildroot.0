From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Feb 2014 13:34:11 -0000
Subject: [Buildroot] [git commit] connman: bump version
Message-ID: <20140228133410.509BC9BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe795f551216940460960c418cd1311341745b74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/connman.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index e0ae7a6..27fe72e 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.19
+CONNMAN_VERSION = 1.21
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
