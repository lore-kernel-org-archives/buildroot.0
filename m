From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 21:55:52 +0200
Subject: [Buildroot] [git commit] package/libostree: bump to version 2019.4
Message-ID: <20191005200048.63BDE81549@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d67d17ee5d8bf64f68926d035e1eb9979b5fa5db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
[Bernd: bump to version 2019.4]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index ddd15b5099..ee9c46fbde 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f263cfed75dcc9e312a874d28241e7143d8a0d8c774938f2165327bae67dbe06  libostree-2018.9.1.tar.xz
+sha256 8dcb25f9d1eb38f3e528f12cf1c73dcfeb5ff23c2fe7da49a0d9ea80388a9d76  libostree-2019.4.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index e8cdd64d6e..f334d42db4 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION_MAJOR = 2018.9
-LIBOSTREE_VERSION= $(LIBOSTREE_VERSION_MAJOR).1
+LIBOSTREE_VERSION_MAJOR = 2019.4
+LIBOSTREE_VERSION= $(LIBOSTREE_VERSION_MAJOR)
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION_MAJOR)
 
