From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Apr 2014 11:35:29 +0200
Subject: [Buildroot] [git commit] libtpl: bump version to v1.6.1
Message-ID: <20140426093817.367829CA0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc7e2babbefd2be47a2027a250603b1105f724a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtpl/libtpl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index 1d4becf..ed3bfb5 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTPL_VERSION = 6df007e450cbee7d7a4896d3538128c5370b1c61
+LIBTPL_VERSION = v1.6.1
 LIBTPL_SITE = $(call github,troydhanson,tpl,$(LIBTPL_VERSION))
 LIBTPL_INSTALL_STAGING = YES
 LIBTPL_LICENSE = BSD-like
