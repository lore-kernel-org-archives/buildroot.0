From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  9 Oct 2014 20:32:38 -0300
Subject: [Buildroot] [PATCH 2/2] iw: bump to version 3.17
In-Reply-To: <1412897558-31636-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412897558-31636-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412897558-31636-2-git-send-email-gustavo@zacarias.com.ar>
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
-- 
2.0.4
