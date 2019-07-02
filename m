From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue,  2 Jul 2019 22:36:07 +0200
Subject: [Buildroot] [PATCH] package/libev: bump to version 4.27
Message-ID: <1562099767-18758-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libev/libev.hash | 2 +-
 package/libev/libev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libev/libev.hash b/package/libev/libev.hash
index ba9d654..9ab341d 100644
--- a/package/libev/libev.hash
+++ b/package/libev/libev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821  libev-4.24.tar.gz
+sha256 2d5526fc8da4f072dd5c73e18fbb1666f5ef8ed78b73bba12e195cfdd810344e  libev-4.27.tar.gz
 sha256 c4dd1a5bc38b041a320b93c5d6c08f5c41a63f2ce718ee16cfcb757fad448199  LICENSE
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 5d9020c..2b2d5db 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEV_VERSION = 4.24
+LIBEV_VERSION = 4.27
 LIBEV_SITE = http://dist.schmorp.de/libev/Attic
 LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2-Clause or GPL-2.0+
-- 
2.7.4
