From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sun,  6 Jun 2010 23:43:20 +0200
Subject: [Buildroot] [PATCH] cdrkit: fix build by adding zlib as dependency
Message-ID: <1275860600-19335-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cdrkit: fix build by adding zlib as dependency.
---
 package/cdrkit/cdrkit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index a6a2e80..a23ffad 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -2,7 +2,7 @@ CDRKIT_VERSION=1.1.10
 CDRKIT_SOURCE=cdrkit-$(CDRKIT_VERSION).tar.gz
 CDRKIT_SITE=http://www.cdrkit.org/releases/
 
-CDRKIT_DEPENDENCIES=libcap bzip2 host-cmake
+CDRKIT_DEPENDENCIES=libcap bzip2 zlib host-cmake
 HOST_CDRKIT_DEPENDENCIES=host-libcap host-cmake host-bzip2
 
 ifeq ($(BR2_ENDIAN),"BIG")
-- 
1.7.0.4
