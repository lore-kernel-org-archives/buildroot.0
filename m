From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun,  7 Jan 2018 20:08:45 +0100
Subject: [Buildroot] [PATCH 1/9] skalibs: bump version to 2.6.3.0
In-Reply-To: <20180107190853.15382-1-eric.le.bihan.dev@free.fr>
References: <20180107190853.15382-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180107190853.15382-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/skalibs/skalibs.hash | 3 ++-
 package/skalibs/skalibs.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index dc3bf13bb7..0936c09a43 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,2 +1,3 @@
 # Locally generated
-sha256 12f9706b412367c45310ab971d204d959441895d3fea6e5e41ab8ef8d24b71b2  skalibs-2.6.2.0.tar.gz
+sha256 81d63a1918189036e9cc679d9b327d36a6056bba89132f35bb1c45b50ceb7226  skalibs-2.6.3.0.tar.gz
+sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index de257f71d1..b8bb8e9576 100644
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
-- 
2.14.3
