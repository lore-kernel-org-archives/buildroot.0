From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 21:43:54 +0100
Subject: [Buildroot] [git commit branch/next] package/htop: bump to 2.1.0
Message-ID: <20180214210141.0773A887CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f869e7358e64a6076fb9387bf219d602cee7159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

No upstream hash provided with this release [1].

Add licence file hash.

[1] http://www.freelists.org/post/htop/ANN-htop-210

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/htop/htop.hash | 6 +++---
 package/htop/htop.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index cfea23f99b..5419d767a3 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
-# Hashes from: http://www.freelists.org/post/htop/ANN-htop-202
-md5	7d354d904bad591a931ad57e99fea84a	htop-2.0.2.tar.gz
-sha1	201f793f13dce2448e36047079875b9bd5bba75a	htop-2.0.2.tar.gz
+# Locally calculated
+sha256  3260be990d26e25b6b49fc9d96dbc935ad46e61083c0b7f6df413e513bf80748  htop-2.1.0.tar.gz
+sha256  70466e76443cb5b68144d9fcedca9584e7bfdb6c50859daa5a0290ea27c58aad  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index d06e4a56d0..71889557ca 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 2.0.2
+HTOP_VERSION = 2.1.0
 HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
 # Prevent htop build system from searching the host paths
