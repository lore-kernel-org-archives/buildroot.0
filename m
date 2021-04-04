From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 12:32:33 +0200
Subject: [Buildroot] [git commit] package/libostree: bump to version 2021.1
Message-ID: <20210404101725.95A898114B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8eda00637873bed0d02dce470b3244a8cb37ccab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 751feb6b2e..bc1249deed 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fdaa5992d0a6f62157152355449ac8476c50df6602be398e9ad10438cc1e679b  libostree-2020.8.tar.xz
+sha256  91b4bd9264831d20ff00ec442d48ede526db55379bd917606863c05f43b85a51  libostree-2021.1.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 7c887ebee8..a0e7e0ef0d 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2020.8
+LIBOSTREE_VERSION = 2021.1
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
