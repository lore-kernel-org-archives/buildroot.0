From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 20:31:35 +0100
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.113
Message-ID: <20141201104839.18CA17FB2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c65e51e303ece33442318b78a2ceee7851d5fb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 2.02.113
- Update the hash value

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash |    2 +-
 package/lvm2/lvm2.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 3d02e83..adffcdb 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/md5.sum
-md5 1f4033b750f68b68e9bd66d3661a2c3f LVM2.2.02.112.tgz
+md5  f71aa8e64030f3d2a3fdabcc36e45094  LVM2.2.02.113.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index bef22fb..48a3116 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.112
+LVM2_VERSION = 2.02.113
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
