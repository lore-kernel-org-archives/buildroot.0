From: Karoly Kasza <kaszak@gmail.com>
Date: Wed, 22 Oct 2014 15:14:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/cdrkit: standardize site URL
Message-ID: <1413983659-3496-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Standardize download site URL using the Debian mirror.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/cdrkit/cdrkit.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index 3f2b429..e1392b6 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -6,7 +6,7 @@
 
 CDRKIT_VERSION = 1.1.11
 CDRKIT_SOURCE = cdrkit_$(CDRKIT_VERSION).orig.tar.gz
-CDRKIT_SITE = http://snapshot.debian.org/archive/debian/20101018T151929Z/pool/main/c/cdrkit/
+CDRKIT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/c/cdrkit
 CDRKIT_DEPENDENCIES = libcap bzip2 zlib
 CDRKIT_LICENSE = GPLv2
 CDRKIT_LICENSE_FILES = COPYING
-- 
1.7.10.4
