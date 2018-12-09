From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 16:54:26 +0100
Subject: [Buildroot] [git commit] package/prosody: bump to version 0.11.1
Message-ID: <20181209155152.4E0AA8B72B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdc9e48f0434c78ded7994747e4da64a64c0aa01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index b38414294c..65bf5c9344 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5    4cb1ac0db2b739b933ded5038551d7c2  prosody-0.10.2.tar.gz
-sha1   1d51e542475c3f3e712eace29537b042c941d6ab  prosody-0.10.2.tar.gz
-sha256 75b5f035e7a74d5f208eeeaf8419b94a85d09b40252d444cff8033fde3c9768e  prosody-0.10.2.tar.gz
-sha512 9fc05e34b45b0c16835ba94a73532fb3b4ee335f27d56bb9260e1b3e22614f89f44eb5d04b4e90d016db0b5bee6f5c7e7d099e1defb027e6823ee7667c1fe28f  prosody-0.10.2.tar.gz
+md5    9157b6eaf05f7dfe004e38dbe950cafd  prosody-0.11.1.tar.gz
+sha1   dacce98fda317f5ba3c05842e2d97018d050b435  prosody-0.11.1.tar.gz
+sha256 91bec43f0798729e0a2b207613a745598ea3ca7dcb7fd85df44ccf04fa5c65aa  prosody-0.11.1.tar.gz
+sha512 6e25d2365d40582f57799bb08bf2673ba43270e8bcca5c5b785381380db55ec3ea6ab771fb9bd228bf265a564bb017dbfeae81713abd2de35a92704f8b8004ef  prosody-0.11.1.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 8c09645210..95c9686795 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.10.2
+PROSODY_VERSION = 0.11.1
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
