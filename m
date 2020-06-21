From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Jun 2020 21:54:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/dash: bump to version 0.5.11
Message-ID: <20200621195414.1656228-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dash/dash.hash | 6 +++---
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index a2e131536a..aa8e378f40 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,4 +1,4 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.10.2.tar.gz.sha256sum
-sha256	3c663919dc5c66ec991da14c7cf7e0be8ad00f3db73986a987c118862b5f6071	dash-0.5.10.2.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.tar.gz.sha256sum
+sha256  4dd9a6ed5fe7546095157918fe5d784bb0b7887ae13de50e1e2d11e1b5a391cb  dash-0.5.11.tar.gz
 # Locally calculated
-sha256	254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72	COPYING
+sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 3014aafe92..55961c5cbe 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.10.2
+DASH_VERSION = 0.5.11
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.26.2
