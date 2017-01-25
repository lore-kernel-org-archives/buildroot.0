From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:25:26 +1300
Subject: [Buildroot] [git commit] checkpolicy: bump version to 2.6
Message-ID: <20170125102553.A004980DAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a9696d918e6c8251891825c503fc88021c22331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index bc5199c..6208d77 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,2 +1,2 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 33af9f3eb19135a7e6536ecd3fbb9686323000016cd51eb88346346ed7546001  checkpolicy-2.5.tar.gz
+sha256 0bebd18688ca8027b1b3b4ff1532c0626f1fe49883ae6cb74d9d385940e74157  checkpolicy-2.6.tar.gz
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index a21b39e..8328b39 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 2.5
-CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
+CHECKPOLICY_VERSION = 2.6
+CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
 CHECKPOLICY_LICENSE = GPLv2
 CHECKPOLICY_LICENSE_FILES = COPYING
 
