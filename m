From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 09:46:50 -0300
Subject: [Buildroot] [PATCH] iw: bump to version 4.0
Message-ID: <1426682810-16339-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iw/iw.hash | 2 +-
 package/iw/iw.mk   | 2 +-
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
-- 
2.0.5
