From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 21:31:28 +0200
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.170
Message-ID: <20170413193140.C5B5482795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dad68d43eba684e8e0c2ef3a212294cb1dc2408
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index a66b0c5..566c487 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 0ff2418c54686f1a99d6196bab5fbc8188152d17ae826760aabd91b49e5f20d19ed1280e3670a769184aac9fd598a20b31312b56add831ed3863473e031b5327  LVM2.2.02.169.tgz
+sha512 971a40f93db2b18a4b5c04f2b34d48cbcce81e6e3999760a474ddc52e8653317ac4969f402b9c9e12e486772bc27da8d9ca448f0551338b2a62031082a113f7c  LVM2.2.02.170.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index ffc1043..11fd8a2 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.169
+LVM2_VERSION = 2.02.170
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
