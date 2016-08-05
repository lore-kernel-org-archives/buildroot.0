From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 5 Aug 2016 09:57:48 +0100
Subject: [Buildroot] [PATCH] xfsprogs: bump version to 4.7.0
Message-ID: <1470387468-63192-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/xfsprogs/xfsprogs.hash | 4 ++--
 package/xfsprogs/xfsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index d250283..1f338b0 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature:
-#   ftp://oss.sgi.com/projects/xfs/cmd_tars/xfsprogs-4.5.0.tar.gz.sig
-sha256 e49beb314984efbd0d758abb5c6137db3bb60a88e59e1e94c00defb536cf89f8  xfsprogs-4.5.0.tar.gz
+#   ftp://oss.sgi.com/projects/xfs/cmd_tars/xfsprogs-4.7.0.tar.gz.sig
+sha256 88580bb3e6847c3edef436703a4fae403fc19b20739db4c31166ee4b256178d7  xfsprogs-4.7.0.tar.gz
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index fb72054..b0875d1 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 4.5.0
+XFSPROGS_VERSION = 4.7.0
 XFSPROGS_SITE = ftp://oss.sgi.com/projects/xfs/cmd_tars
 
 XFSPROGS_DEPENDENCIES = util-linux
-- 
2.7.3
