From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 13 Mar 2017 12:37:53 +0000
Subject: [Buildroot] [PATCH] screen: bump version to 4.5.1
Message-ID: <20170313123753.63956-1-Vincent.Riera@imgtec.com>
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
index 7ddc337..1686117 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 01c3a7c362185f35d6a95dff52d64337076496acd034d717de3c263500cfefb0  screen-4.5.0.tar.gz
+sha256 97db2114dd963b016cd4ded34831955dcbe3251e5eee45ac2606e67e9f097b2d  screen-4.5.1.tar.gz
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 519a02a..e67eb4a 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 4.5.0
+SCREEN_VERSION = 4.5.1
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPLv3+
 SCREEN_LICENSE_FILES = COPYING
-- 
2.10.2
