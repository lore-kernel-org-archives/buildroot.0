From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 16 Oct 2017 07:25:28 -0400
Subject: [Buildroot] [PATCH 1/1] sngrep: bump to v1.4.4
Message-ID: <20171016112528.21341-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add LICENSE sha256 hash.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/sngrep/sngrep.hash | 6 +++++-
 package/sngrep/sngrep.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
index 34c724b09b..cd2dff5536 100644
--- a/package/sngrep/sngrep.hash
+++ b/package/sngrep/sngrep.hash
@@ -1,2 +1,6 @@
+# From https://github.com/irontec/sngrep/releases/download/v1.4.4/sngrep-1.4.4.tar.gz.md5sum
+md5 8e2286c2e23f4b29667025e5809dc303  sngrep-1.4.4.tar.gz
+
 # Locally computed
-sha256 7385ac202de6d6a1feffb2fd514600563133d9dfa7fb47be052de839abcc1d52 sngrep-v1.4.3.tar.gz
+sha256 2379b8b3e9498d426a0bc03b90d74170a80f98f167f89c126d53dcc66bc5f60b sngrep-v1.4.4.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 67ef882e28..7442cef529 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNGREP_VERSION = v1.4.3
+SNGREP_VERSION = v1.4.4
 SNGREP_SITE = $(call github,irontec,sngrep,$(SNGREP_VERSION))
 SNGREP_LICENSE = GPL-3.0+
 SNGREP_LICENSE_FILES = LICENSE
-- 
2.13.6
