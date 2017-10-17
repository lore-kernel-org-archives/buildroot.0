From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 23:37:36 +0200
Subject: [Buildroot] [git commit] sngrep: bump to v1.4.4
Message-ID: <20171017213014.969F881102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6964ca40ae058a4b8164b9afbe950f39bebaa53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add LICENSE sha256 hash.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sngrep/sngrep.hash | 6 +++++-
 package/sngrep/sngrep.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
index 34c724b..cd2dff5 100644
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
index 67ef882..7442cef 100644
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
