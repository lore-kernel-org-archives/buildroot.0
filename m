From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:40:44 +0100
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.138
Message-ID: <20151215204048.C108281DBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61ba27c16a48ba4657c4ebaec55eb59a2330f17d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 539bf49..17434ff 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 d042bad51eacc350e3a2b08a631498d7bdff29032804e7db4c6a0723e8896628b89e6395a311535c09429429c17adfeb45794d5f53bdeb5d51b195114fca309a  LVM2.2.02.137.tgz
+sha512 d827cbd5dde6079f9fedb6bd64025d33a93a00cd1af6d57873be78df07069c5b9921077d6be98a6445829cfea28ba7a5520db0be58d6e7a7824f1a722d739fb6  LVM2.2.02.138.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 59206cc..cfee44b 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.137
+LVM2_VERSION = 2.02.138
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
