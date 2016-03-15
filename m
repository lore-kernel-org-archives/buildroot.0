From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:12:26 +0100
Subject: [Buildroot] [git commit] xorriso: Bump version to 1.4.2
Message-ID: <20160315221316.8677180AE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e495978c982fc1d7c4760fd1c27878e4dd2e2d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xorriso/xorriso.hash | 2 +-
 package/xorriso/xorriso.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xorriso/xorriso.hash b/package/xorriso/xorriso.hash
index 98a716d..3c2a726 100644
--- a/package/xorriso/xorriso.hash
+++ b/package/xorriso/xorriso.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 901204634651533f7cbd105eab560534702458258529aac4b2f0fc946992107e xorriso-1.3.8.tar.gz
+sha256 2843beded1aa4c678706e96fdf9cc5e4b34430b559bdf5bc35df5202125004b3 xorriso-1.4.2.tar.gz
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index 5826340..e8bb5cb 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORRISO_VERSION = 1.3.8
+XORRISO_VERSION = 1.4.2
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPLv3+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
