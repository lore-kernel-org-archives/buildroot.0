From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Dec 2020 15:46:54 +0100
Subject: [Buildroot] [git commit] package/htop: bump to version 3.0.3
Message-ID: <20201214143043.03BDC83B8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfb8129b600f2f459f981aaf43838df568c45ee5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/htop/htop.hash | 2 +-
 package/htop/htop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index fb8d0bff41..d788c8e5cb 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6471d9505daca5c64073fc37dbab4d012ca4fc6a7040a925dad4a7553e3349c4  htop-3.0.2.tar.gz
+sha256  5a0909956cd9289871269b1d146580b9c1e11218bb6d454c21d781161b6dae0f  htop-3.0.3.tar.gz
 sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 457926afe0..0bea775a5a 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.0.2
+HTOP_VERSION = 3.0.3
 HTOP_SITE = https://dl.bintray.com/htop/source
 HTOP_DEPENDENCIES = ncurses
 # Prevent htop build system from searching the host paths
