From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  2 Jun 2016 22:10:33 -0300
Subject: [Buildroot] [PATCH] iw: bump to version 4.7
Message-ID: <1464916233-17916-1-git-send-email-gustavo@zacarias.com.ar>
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
index 424a71e..f22ceb1 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256	a6add81a51667649d8d7cfba783ab6a0f82e250a663a4065b13babdff3f6b220	iw-4.3.tar.xz
+sha256	d1720c04bc26661d42e71d13746d5c3aeedb6bdf743f7d6b7b056f0abd345ee8	iw-4.7.tar.xz
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 3c1767a..200e703 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 4.3
+IW_VERSION = 4.7
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
-- 
2.7.3
