From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 23:19:20 +0100
Subject: [Buildroot] [git commit branch/next] package/fswebcam: bump to
 latest version
Message-ID: <20200305221309.76DD58F59B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df49c9cb45f566ea861faf787483e24eace76f67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump to latest git version.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fswebcam/fswebcam.hash | 2 +-
 package/fswebcam/fswebcam.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fswebcam/fswebcam.hash b/package/fswebcam/fswebcam.hash
index 3964b21e92..bac1626785 100644
--- a/package/fswebcam/fswebcam.hash
+++ b/package/fswebcam/fswebcam.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe178a0f37ee203103eceaaf9a81a8669edb49923250e8a2ec7459543a8175b0  fswebcam-9a995d6a5369ddd158e352766e015dae20982318.tar.gz
+sha256  5702771cee6e3fa0f2bbbb72ecf3e5a253ff458c1f648f7e7c0d477e39f0ec80  fswebcam-e9f8094b6a3d1a49f99b2abec4e6ab4df33e2e33.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/fswebcam/fswebcam.mk b/package/fswebcam/fswebcam.mk
index 5887c0b92b..3a5b8c9eef 100644
--- a/package/fswebcam/fswebcam.mk
+++ b/package/fswebcam/fswebcam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FSWEBCAM_VERSION = 9a995d6a5369ddd158e352766e015dae20982318
+FSWEBCAM_VERSION = e9f8094b6a3d1a49f99b2abec4e6ab4df33e2e33
 FSWEBCAM_SITE = $(call github,fsphil,fswebcam,$(FSWEBCAM_VERSION))
 FSWEBCAM_LICENSE = GPL-2.0
 FSWEBCAM_LICENSE_FILES = LICENSE
