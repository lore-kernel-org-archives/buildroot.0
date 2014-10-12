From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 12:30:10 +0200
Subject: [Buildroot] [git commit] libuci: bump version
Message-ID: <20141012104112.A3946B23A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab73c6c7b9a2c4cba0a36347898757240ec03479
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexey Mednyy <swexru@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuci/libuci.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index ce18a38..9d5c172 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCI_VERSION = ed938cc8e423d4a33b8f31e6e6d1eb0805ae3d10
+LIBUCI_VERSION = e339407372ffc70b1451e4eda218c01aa95a6a7f
 LIBUCI_SITE = git://nbd.name/uci.git
 LIBUCI_LICENSE = LGPLv2.1
 LIBUCI_INSTALL_STAGING = YES
