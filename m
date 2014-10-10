From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Oct 2014 08:43:02 +0200
Subject: [Buildroot] [git commit] iw: bump to version 3.17
Message-ID: <20141010100415.C7DB3B1D53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=884b84e2ee245e425ad8e71118fdeeb48abe3690
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iw/iw.hash |    2 +-
 package/iw/iw.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index a635646..118a22c 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256	bd5c0a92cea799e22bcf431dfe0f91a3ba293ce078e9d95e53d7dbb26df24b8a	iw-3.15.tar.xz
+sha256	48a62eb5cd8e757c9617749df96b01f133c184f6c107f18be660ee08f155fa93	iw-3.17.tar.xz
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index f533a45..544ac55 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 3.15
+IW_VERSION = 3.17
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
