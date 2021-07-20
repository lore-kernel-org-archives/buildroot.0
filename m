From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 20 Jul 2021 09:30:05 -0600
Subject: [Buildroot] [PATCH 1/1] package/less: bump to version 590
Message-ID: <20210720153005.314976-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index e675569cd8..eed8340ec1 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# http://www.greenwoodsoftware.com/less/less-563.sig
-sha256  ce5b6d2b9fc4442d7a07c93ab128d2dff2ce09a1d4f2d055b95cf28dd0dc9a9a  less-563.tar.gz
+# http://www.greenwoodsoftware.com/less/less-590.sig
+sha256  6aadf54be8bf57d0e2999a3c5d67b1de63808bb90deb8f77b028eafae3a08e10  less-590.tar.gz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index a15bd25bec..7d7a6d5fe5 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 563
+LESS_VERSION = 590
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
-- 
2.25.1
