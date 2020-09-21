From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 21 Sep 2020 12:42:01 +0200
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.0.2
Message-ID: <20200921104201.693400-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/htop/htop.hash | 2 +-
 package/htop/htop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 23d9c767b..fb8d0bff4 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e9dbf91e621216e7baab6b72ae2251b57e9d3c7b20682a826f627b618eb0fe1b  htop-3.0.1.tar.gz
+sha256  6471d9505daca5c64073fc37dbab4d012ca4fc6a7040a925dad4a7553e3349c4  htop-3.0.2.tar.gz
 sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index f07282ace..457926afe 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.0.1
+HTOP_VERSION = 3.0.2
 HTOP_SITE = https://dl.bintray.com/htop/source
 HTOP_DEPENDENCIES = ncurses
 # Prevent htop build system from searching the host paths
-- 
2.25.1
