From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 16 Sep 2020 09:48:43 +0200
Subject: [Buildroot] [PATCH] package/dash: bump to version 0.5.11.2
Message-ID: <20200916074843.211307-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dash/dash.hash | 4 ++--
 package/dash/dash.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index aa8e378f4..069a7b179 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,4 +1,4 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.tar.gz.sha256sum
-sha256  4dd9a6ed5fe7546095157918fe5d784bb0b7887ae13de50e1e2d11e1b5a391cb  dash-0.5.11.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.2.tar.gz.sha256sum
+sha256  00fb7d68b7599cc41ab151051c06c01e9500540183d8aa72116cb9c742bd6d5f  dash-0.5.11.2.tar.gz
 # Locally calculated
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 55961c5cb..88caa6609 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.11
+DASH_VERSION = 0.5.11.2
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.25.1
