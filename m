From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 22:16:20 +0100
Subject: [Buildroot] [git commit branch/next] libostree: bump to version
 2018.2
Message-ID: <20180215211717.98DBF875BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaa81347ad383ed7da5dcd2f9abf4299281cf863
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 54bc263f06..6ae4824007 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 8b5e3b80425b91c93aeb916bb047ee194aa138a9cf00ce173dcc0ebc0dd11f4b  libostree-2018.1.tar.xz
+sha256 37661de4a0ac73af5d921f494f17dd052ae2844111ba7c5aaeb1cbc4aae94bea  libostree-2018.2.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 336d11a978..236657e9fa 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2018.1
+LIBOSTREE_VERSION = 2018.2
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
