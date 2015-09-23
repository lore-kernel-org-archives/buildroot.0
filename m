From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Sep 2015 23:12:26 +0200
Subject: [Buildroot] [git commit] lvm2: bump to version 2.02.132
Message-ID: <20150923211231.3D4F881681@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a8c03614f195f8acb2a73bca69ff89caec43c02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash |    4 ++--
 package/lvm2/lvm2.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 6aae05a..49a1655 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,4 +1,4 @@
 # From ftp://sources.redhat.com/pub/lvm2/md5.sum
-md5 e7ae07e413120713549cc6dd2a558c75  LVM2.2.02.130.tgz
+md5 80af5af726949bbbb2aceb15b24b7d20  LVM2.2.02.132.tgz
 # Locally calculated
-sha256 1d9af1ce498453639bb353d593980eca5c7ca9cc7734ace61454191f7c669d29  LVM2.2.02.130.tgz
+sha256 413aa09cd5babb2e01b0209ed4be514645fa8b492664f57f384352a7f58f8829  LVM2.2.02.132.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 73a27ad..6df9b35 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.130
+LVM2_VERSION = 2.02.132
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
