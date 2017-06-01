From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 20:28:50 -0000
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.171
Message-ID: <20170601202849.1971782A83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca944de53601f4d9ac01b07a46f24814f342d7fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 566c487..81d0e97 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 971a40f93db2b18a4b5c04f2b34d48cbcce81e6e3999760a474ddc52e8653317ac4969f402b9c9e12e486772bc27da8d9ca448f0551338b2a62031082a113f7c  LVM2.2.02.170.tgz
+sha512 801adcc2ae483f81edf6bfba73090b6b8f710370e48764f08a62da71d617157075bea01593c2535ad5ba71dcb5e0cfe83cec9a65180a6e8b9e0d214bdee79883  LVM2.2.02.171.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 11fd8a2..9a422fe 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.170
+LVM2_VERSION = 2.02.171
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
