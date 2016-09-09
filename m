From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Sep 2016 17:01:29 +0200
Subject: [Buildroot] [git commit] smcroute: bump to version 2.1.1
Message-ID: <20160909150500.BFC7F80156@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=663be5dbb7659334e9c9615ef3d91fedd66e67ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/smcroute/smcroute.hash | 6 +++---
 package/smcroute/smcroute.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index b24228f..e1483ec 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  66fd32dc66b5d32670918205a94c4f2ac8c56741486326922e4d1a92f628db48  smcroute-2.0.0.tar.xz
-# From https://github.com/troglobit/smcroute/releases/download/2.0.0/smcroute-2.0.0.tar.xz.md5
-md5     cbf478e52ab9ae411adca41b9d22f68a  smcroute-2.0.0.tar.xz
+sha256  cf344922b4298b94e53fa2db8f2b064bece60f75926966f330437dfcbd76d425  smcroute-2.1.1.tar.xz
+# From https://github.com/troglobit/smcroute/releases/download/2.1.1/smcroute-2.1.1.tar.xz.md5
+md5     cd9256577fe06beaf8da2eba1a02f953  smcroute-2.1.1.tar.xz
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 77e7e63..a3d4bc4 100755
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.0.0
+SMCROUTE_VERSION = 2.1.1
 SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPLv2+
