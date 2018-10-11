From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 22:02:33 +0200
Subject: [Buildroot] [git commit] checkpolicy: bump to version 2.8
Message-ID: <20181011200602.332A783461@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e412462887cbb4195f7f0b86aa28654a4919235
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/checkpolicy/checkpolicy.hash | 5 ++++-
 package/checkpolicy/checkpolicy.mk   | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index 7397393a76..cf38d6e2f4 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,2 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 5413479f1dcde866c19896b4dbfec315d822aa431606e1d03c944408984c3201  checkpolicy-2.7.tar.gz
+sha256 9dec811c24b88e58c3bf741365eacf1dbb945531a2fcb8f284aacf68098194c8  checkpolicy-2.8.tar.gz
+
+# Hash for license file
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 52f816098d..7143b2d7d2 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 2.7
-CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+CHECKPOLICY_VERSION = 2.8
+CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = COPYING
 
