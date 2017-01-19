From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jan 2017 15:00:01 +0100
Subject: [Buildroot] [git commit] screen: bump version to 4.5.0
Message-ID: <20170119140932.2AC9981871@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8480c528398ecb35bf62d857f25f6b7eaa0f44a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
