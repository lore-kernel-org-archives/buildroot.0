From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Apr 2016 22:20:48 +0200
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.149
Message-ID: <20160405203417.368E981D67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58820b45cca313122bb6fe713d38ac51a7bc3f97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 2a26633..88998c4 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 549d9d772eae7054c6d9b0d0a7f65e3930f6109b81e8e58ce265f9f3732ea322a0c81acc9e9714ca16c2670ee519ea28a74470b3daf8b0ca05d82decee2443b4  LVM2.2.02.148.tgz
+sha512 f00310fd398d4f84d67677e47b148ab5cc79319e25547ee56160703a425f2f506a4c92ee9958c363a1640ae1fa17b4337242d76e0c5e4a256192edfbf9c4fcdc  LVM2.2.02.149.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index fa35acd..d17a772 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.148
+LVM2_VERSION = 2.02.149
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
