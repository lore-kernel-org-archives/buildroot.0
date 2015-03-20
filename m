From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 21:45:38 +0100
Subject: [Buildroot] [git commit] iw: bump to version 4.0
Message-ID: <20150320204747.6CC2081898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f4707e2d6920dde3da8c4a46074b79e15c3c540
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iw/iw.hash |    2 +-
 package/iw/iw.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index 118a22c..be0428c 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256	48a62eb5cd8e757c9617749df96b01f133c184f6c107f18be660ee08f155fa93	iw-3.17.tar.xz
+sha256	2b4b7906d5ce89ce0ab523e5de8b619cddcc18fee7a2bfd6f9c62efab2d3bed6	iw-4.0.tar.xz
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 1286915..4fd18ac 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 3.17
+IW_VERSION = 4.0
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
