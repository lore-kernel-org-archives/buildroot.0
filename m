From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 17:41:11 +0100
Subject: [Buildroot] [git commit] package/lvm2: bump version to 2.02.185
Message-ID: <20200204164418.1F8BA8B629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c93af327916f6d6813e2344a61f3fa2c57db1b33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index ad0d93b144..3d560c4be3 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,5 +1,5 @@
 # From ftp://sources.redhat.com/pub/lvm2/sha512.sum
-sha512 3947523c6b0862ada40677ed171ed0cf95e070119e377296fc5ccb153e9c4212d34c0b16a887dbd68ccf265525345dabfed2aa59fb3604555429a7e2ecfff4d7  LVM2.2.02.183.tgz
+sha512 f421505551aec2a09bc862f2fcc1ee825bc4d94c53a01d13265631e99308d60fbca40112be5bc7824cce3ef223c0775d2f6c345f6a3f227229a0566c903841bf  LVM2.2.02.185.tgz
 # Locally computed sha256 checksums
 sha256 e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
 sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LIB
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 3da713fe83..43370b03bf 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.183
+LVM2_VERSION = 2.02.185
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2
 LVM2_INSTALL_STAGING = YES
