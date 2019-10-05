From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:08:41 +0200
Subject: [Buildroot] [git commit] package/minicom: bump version
Message-ID: <20191005210508.2A26A88F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e23895b9992ffce26f9953b41f1bcafd1bfafe5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Shortlog follows:
Adam Lackorzynski (5):
      Update norwegian translation
      Fix a sprintf string rendering warning
      Add buf size to input function
      Fix a strncpy warning
      Fix more strncpy warnings

Giulio Benetti (1):
      .hgignore: add .gitignore instead of .hgignore

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minicom/minicom.hash | 2 +-
 package/minicom/minicom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index ec2a1812ff..03e1dcc7d0 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3f2100099e852c17e18c1249fa516c9806b3491f345b7661ba9bbf3e66313dc3  minicom-1e84585e8e7710677b6ff9a70dce5f3ad3e23540.tar.gz
+sha256 be5d923c399bc15dade7bc89052d887034abd49b386138c16bdcb912f2135098  minicom-5086119bbaafd2f8986579209885635b92020096.tar.gz
 sha256 cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index a3c58d2d4e..11d69d4d0e 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 1e84585e8e7710677b6ff9a70dce5f3ad3e23540
+MINICOM_VERSION = 5086119bbaafd2f8986579209885635b92020096
 MINICOM_SITE = https://salsa.debian.org/minicom-team/minicom.git
 MINICOM_SITE_METHOD = git
 MINICOM_LICENSE = GPL-2.0+
