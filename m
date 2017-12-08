From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Dec 2017 17:49:29 +0100
Subject: [Buildroot] [git commit] libostree: bump to version 2017.14
Message-ID: <20171208164209.2155781132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86e46797cad96ba4f9b37406dd0a343f6941de4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 162af31..b0a5580 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a8b06cd81b40072b127e9a8aa5d8c7a61bb44d8bc0e7f7b73dee2ce4d9b3e752  libostree-2017.13.tar.xz
+sha256 cab4782a7ab1c4d7ab8e390372788b73a7f83d9284418ba36a42b60cbc67851e  libostree-2017.14.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 1d5936a..3ac8278 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2017.13
+LIBOSTREE_VERSION = 2017.14
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
