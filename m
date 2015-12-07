From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Dec 2015 17:19:02 +0100
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.137
Message-ID: <20151207162023.50EDF81950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f368a4ec92115126d159f3e5af5f48c10dbc3fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 99c576e..539bf49 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 ebda683e7dbeb2c4860a583d47e60756d18127e37a373ab2958af8e54b9bee0d2e3370b7803d88fa4b08564345c88af55bfbac317081160118ce4b3733b69f9d  LVM2.2.02.136.tgz
+sha512 d042bad51eacc350e3a2b08a631498d7bdff29032804e7db4c6a0723e8896628b89e6395a311535c09429429c17adfeb45794d5f53bdeb5d51b195114fca309a  LVM2.2.02.137.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 71e69d6..59206cc 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.136
+LVM2_VERSION = 2.02.137
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
