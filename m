From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu,  1 Jul 2021 07:01:00 +0200
Subject: [Buildroot] [PATCH 1/2] package/gqrx: Bump version to 2.14.4
Message-ID: <20210701050101.23916-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gqrx/gqrx.hash | 2 +-
 package/gqrx/gqrx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
index bfa4411c2c..1991dfea82 100644
--- a/package/gqrx/gqrx.hash
+++ b/package/gqrx/gqrx.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  ff3a9e350f730823dec8edb38cddfd72f602c909cc4ac39082c445eb66f88d96  gqrx-2.13.2.tar.gz
+sha256  aec35c77ebde9c71a5f973c509eec3d6aa2f18a6e052b180fcd9029d88273e5b  gqrx-2.14.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  7cc22ce5ee61df62e427ec43b8130de149edee3cafb5af4f18d59b6dc3958faf  LICENSE-CTK
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index dd15db2890..4d464298ca 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GQRX_VERSION = 2.13.2
+GQRX_VERSION = 2.14.4
 GQRX_SITE = $(call github,csete,gqrx,v$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
-- 
2.20.1
