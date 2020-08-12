From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 12 Aug 2020 09:54:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/wlroots: bump to version 0.11.0
Message-ID: <20200812075428.57782-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 20f7313bb..636f39101 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,5 @@
-# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.10.1/wlroots-0.10.1.tar.gz.sig
-sha256  b84baefbaff7bb04b3d2c43cbacef1a433e2cd65111f8fbf4bfc5faaa4b34b08  wlroots-0.10.1.tar.gz
+# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.11.0/wlroots-0.11.0.tar.gz.sig
+sha256  a7645e77229aab4942748c621be8bdb8b073d94f35f3e032b867246862bf2d01  wlroots-0.11.0.tar.gz
 
 # Hashes for license files:
 sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 988643485..7923e9432 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.10.1
+WLROOTS_VERSION = 0.11.0
 WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
-- 
2.25.1
