From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 16 Aug 2019 09:04:56 +0200
Subject: [Buildroot] [PATCH] package/chipmunk: bump to version 7.0.3
Message-ID: <20190816070456.29235-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/chipmunk/chipmunk.hash | 2 +-
 package/chipmunk/chipmunk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/chipmunk/chipmunk.hash b/package/chipmunk/chipmunk.hash
index 7bd9b1569..fc34639aa 100644
--- a/package/chipmunk/chipmunk.hash
+++ b/package/chipmunk/chipmunk.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	6b6d8d5d910c4442fb9c8c4c46a178126d8c21d075cdb3ce439a7f8d8757b0ca  Chipmunk-7.0.2.tar.gz
+sha256	1e6f093812d6130e45bdf4cb80280cb3c93d1e1833d8cf989d554d7963b7899a  Chipmunk-7.0.3.tar.gz
 
 # Hash for license file:
 sha256	109cedb0301cba4e05fa99241f162bdad015c9541ae84b420b0148ac1ea588e2  LICENSE.txt
diff --git a/package/chipmunk/chipmunk.mk b/package/chipmunk/chipmunk.mk
index a84af2282..e85af5d12 100644
--- a/package/chipmunk/chipmunk.mk
+++ b/package/chipmunk/chipmunk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHIPMUNK_VERSION = 7.0.2
+CHIPMUNK_VERSION = 7.0.3
 CHIPMUNK_SITE = https://github.com/slembcke/Chipmunk2D/archive
 CHIPMUNK_SOURCE = Chipmunk-$(CHIPMUNK_VERSION).tar.gz
 CHIPMUNK_INSTALL_STAGING = YES
-- 
2.20.1
