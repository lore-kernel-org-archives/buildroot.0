From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 18:52:13 +0100
Subject: [Buildroot] [git commit] package/screenfetch: make version
 compliant with release-monitoring
Message-ID: <20210119173328.1F71A87F3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d806144205de95027e744b1fba052d7b865c33e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/screenfetch/screenfetch.hash | 2 +-
 package/screenfetch/screenfetch.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/screenfetch/screenfetch.hash b/package/screenfetch/screenfetch.hash
index 9730041948..4f16c616cf 100644
--- a/package/screenfetch/screenfetch.hash
+++ b/package/screenfetch/screenfetch.hash
@@ -1,2 +1,2 @@
-sha256  aa97dcd2a8576ae18de6c16c19744aae1573a3da7541af4b98a91930a30a3178  screenfetch-v3.9.1.tar.gz
+sha256  aa97dcd2a8576ae18de6c16c19744aae1573a3da7541af4b98a91930a30a3178  screenfetch-3.9.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/screenfetch/screenfetch.mk b/package/screenfetch/screenfetch.mk
index b4eb452c97..d1315d24e4 100644
--- a/package/screenfetch/screenfetch.mk
+++ b/package/screenfetch/screenfetch.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SCREENFETCH_VERSION = v3.9.1
-SCREENFETCH_SITE = $(call github,KittyKatt,screenFetch,$(SCREENFETCH_VERSION))
+SCREENFETCH_VERSION = 3.9.1
+SCREENFETCH_SITE = $(call github,KittyKatt,screenFetch,v$(SCREENFETCH_VERSION))
 SCREENFETCH_LICENSE = GPL-3.0+
 SCREENFETCH_LICENSE_FILES = COPYING
 
