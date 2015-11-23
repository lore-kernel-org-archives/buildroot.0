From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 18:31:18 +0100
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.135
Message-ID: <20151201232120.DFF75802AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa7a32b24da084ef583a5a042d65b41640b23a8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index c6a9ea1..a51b9a4 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512	d5c695c9f3120d8e20845510f11204e6f8d13b6656a05c78f1b71482e97f63fd93ede54ec99cab14074421d3ecf6e501ec9e6581976ff266158f2910d25bbcf3	LVM2.2.02.132.tgz
+sha512 698fadf1a12f6bfc6f8bd9d6499d2cf181e2cf7b9a5105b58cb55168f6104c949aa5d5da0585194d54614128a14abc7b939d43b32f7175057ad14cb1c62796a0  LVM2.2.02.135.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 6df9b35..9caa051 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.132
+LVM2_VERSION = 2.02.135
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
