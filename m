From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 17 Jan 2018 08:40:40 +0100
Subject: [Buildroot] [PATCH 1/1] skalibs: bump version to 2.6.3.1
Message-ID: <20180117074040.18771-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

 http://autobuild.buildroot.net/results/59f3b6d5fe3e9b561adbafc08eeb1a23f7100278/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/skalibs/skalibs.hash | 2 +-
 package/skalibs/skalibs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index 0936c09a43..a65aaadb3d 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 81d63a1918189036e9cc679d9b327d36a6056bba89132f35bb1c45b50ceb7226  skalibs-2.6.3.0.tar.gz
+sha256 8508ca00d4e2355e9ec0ec7f4808e98b349999d6732d2f123ac53b4df5260c81  skalibs-2.6.3.1.tar.gz
 sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index b8bb8e9576..2ce0c33ff0 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.6.3.0
+SKALIBS_VERSION = 2.6.3.1
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
-- 
2.14.3
