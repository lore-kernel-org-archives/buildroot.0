From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 23:49:27 +0100
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.117
Message-ID: <20150306224933.47D9981825@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62dc087f9f4b02feb2b5a5504dfedeac31965029
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 2.02.117
- Update the hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash |    2 +-
 package/lvm2/lvm2.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index adffcdb..e7f7b2d 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/md5.sum
-md5  f71aa8e64030f3d2a3fdabcc36e45094  LVM2.2.02.113.tgz
+md5  ab5889dae7924b44ed2444161058a419  LVM2.2.02.117.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 48a3116..6e324eb 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.113
+LVM2_VERSION = 2.02.117
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
