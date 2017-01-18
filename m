From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 18 Jan 2017 11:09:37 +0000
Subject: [Buildroot] [PATCH] screen: bump version to 4.5.0
Message-ID: <20170118110937.43880-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/screen/screen.hash | 2 +-
 package/screen/screen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index ee5105a..7ddc337 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 ef722a54759a3bf23aad272bbf33c414c1078cad6bcd982fada93c0d7917218b  screen-4.4.0.tar.gz
+sha256 01c3a7c362185f35d6a95dff52d64337076496acd034d717de3c263500cfefb0  screen-4.5.0.tar.gz
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 16a97cc..519a02a 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 4.4.0
+SCREEN_VERSION = 4.5.0
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPLv3+
 SCREEN_LICENSE_FILES = COPYING
-- 
2.10.2
