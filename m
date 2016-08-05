From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 21:05:56 +0200
Subject: [Buildroot] [git commit] xfsprogs: bump version to 4.7.0
Message-ID: <20160805190559.570AD82260@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdc5dea65f845cc95b2f4fc86c57328113ece28d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
