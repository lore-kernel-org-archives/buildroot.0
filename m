From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 17:46:09 +0200
Subject: [Buildroot] [git commit] lvm2: bump to version 2.02.124
Message-ID: <20150706154818.CA208818B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2bef06197af4108f522d8c139d509eca19c1416
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash |    2 +-
 package/lvm2/lvm2.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index e6047bb..982cfc7 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/md5.sum
-md5  5ae469f1a021729d3db9d269077ad4fe  LVM2.2.02.123.tgz
+md5  da8d81a6a2ea235025795d9e001a6ae3  LVM2.2.02.124.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 6a3aec3..c112b97 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.123
+LVM2_VERSION = 2.02.124
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
