From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  1 Jun 2015 12:59:19 -0300
Subject: [Buildroot] [PATCH 1/2] iw: bump to version 4.1
Message-ID: <1433174360-1519-1-git-send-email-gustavo@zacarias.com.ar>
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
index be0428c..02f9a52 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256	2b4b7906d5ce89ce0ab523e5de8b619cddcc18fee7a2bfd6f9c62efab2d3bed6	iw-4.0.tar.xz
+sha256	5164aaacd8e82501d84a2187af194e8285a5a5b76e200447eb58d4dd78d1a34b	iw-4.1.tar.xz
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 4fd18ac..2766850 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 4.0
+IW_VERSION = 4.1
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
-- 
2.3.6
