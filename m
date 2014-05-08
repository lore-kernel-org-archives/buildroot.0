From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu,  8 May 2014 10:59:42 +0200
Subject: [Buildroot] [PATCH 1/2] libcec: Bump version
Message-ID: <1399539583-31334-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libcec/libcec.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 99cc767..0aabb06 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = libcec-2.1.1
+LIBCEC_VERSION = libcec-2.1.4-repack
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
-- 
1.9.2
