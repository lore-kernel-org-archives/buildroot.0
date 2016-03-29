From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 14:57:36 +0200
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.148
Message-ID: <20160329125758.4D5E4819E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70aad996b7f7fb11a6b00ee151b528e90b692834
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 9fae427..2a26633 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 ec590c9e9b1ebbe5a77053ca4ba82d9c2cc04c69ef768cfd361d94cf23f8f83eda7cbe2f7ebf5f6caf63a08bff73b01734a05614ca24838bf35adc2e50e60d7c  LVM2.2.02.147.tgz
+sha512 549d9d772eae7054c6d9b0d0a7f65e3930f6109b81e8e58ce265f9f3732ea322a0c81acc9e9714ca16c2670ee519ea28a74470b3daf8b0ca05d82decee2443b4  LVM2.2.02.148.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index ec4dc9f..fa35acd 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.147
+LVM2_VERSION = 2.02.148
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
