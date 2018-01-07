From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:37:08 +0100
Subject: [Buildroot] [git commit] skalibs: bump version to 2.6.3.0
Message-ID: <20180107203751.8F39A83BA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb1be92e6fd40d9b47b32472a370b7b806cf5ad2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/skalibs/skalibs.hash | 3 ++-
 package/skalibs/skalibs.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index dc3bf13..0936c09 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,2 +1,3 @@
 # Locally generated
-sha256 12f9706b412367c45310ab971d204d959441895d3fea6e5e41ab8ef8d24b71b2  skalibs-2.6.2.0.tar.gz
+sha256 81d63a1918189036e9cc679d9b327d36a6056bba89132f35bb1c45b50ceb7226  skalibs-2.6.3.0.tar.gz
+sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index de257f7..b8bb8e9 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.6.2.0
+SKALIBS_VERSION = 2.6.3.0
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
