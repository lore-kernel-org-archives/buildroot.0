From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Sep 2015 18:58:29 -0300
Subject: [Buildroot] [PATCH] iw: bump to version 4.3
Message-ID: <1442872709-13861-1-git-send-email-gustavo@zacarias.com.ar>
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
index 02f9a52..424a71e 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256	5164aaacd8e82501d84a2187af194e8285a5a5b76e200447eb58d4dd78d1a34b	iw-4.1.tar.xz
+sha256	a6add81a51667649d8d7cfba783ab6a0f82e250a663a4065b13babdff3f6b220	iw-4.3.tar.xz
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 2766850..3c1767a 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 4.1
+IW_VERSION = 4.3
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
-- 
2.4.9
