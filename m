From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Sep 2016 17:34:37 +0200
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.165
Message-ID: <20160907153508.F02E582271@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75f217f253837c01360f61c6c3535011ab2891b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 18bd62c..c7e7307 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 6316505e185673471a3434aec10f7978461688eb6c8391b02326a09bd0e83f8bedb2cbccb3c8dd2be0475bf516443ef23f09d1001bcff5b0dfd40941b3f1aefc  LVM2.2.02.163.tgz
+sha512 33324ad334852bc4217a9c33ded0a05645dac5141c68e34f1d385662be7e5bd5a4bc73539dd9c507cd7013d67b893b171df5d59e4f0b253233b003e7d48ac7a0  LVM2.2.02.165.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 11eedbe..3a5dcff 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.163
+LVM2_VERSION = 2.02.165
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
