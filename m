From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:28:11 +0200
Subject: [Buildroot] [git commit branch/next] lvm2: bump version to 2.02.163
Message-ID: <20160810122819.C9BC881D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c418fdc410bbf0a6418ccea32c544fe94945749
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 65945a1..18bd62c 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 9544bb7706488ac128d477af7294bcfd7b7e47cb0b1d604ea52c4545d6c3a5a71311945994dd1114cb1ce086d2006a35ef1d8b0fdd3082dfe5cc468cb0168057  LVM2.2.02.162.tgz
+sha512 6316505e185673471a3434aec10f7978461688eb6c8391b02326a09bd0e83f8bedb2cbccb3c8dd2be0475bf516443ef23f09d1001bcff5b0dfd40941b3f1aefc  LVM2.2.02.163.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 8a51120..11eedbe 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.162
+LVM2_VERSION = 2.02.163
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
