From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:34 -0000
Subject: [Buildroot] [git commit] package/luv: bump to version 1.30.1-0
Message-ID: <20190903133617.95C9F8A5E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c933748a498cb7cc36aa16798b1276936746b47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index a27cb36936..c3a3062e1c 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5cc75a012bfa9a5a1543d0167952676474f31c2d7fd8d450b56d8929dbebb5ef  luv-1.30.0-0.tar.gz
+sha256 420fc299f3b25aff55b839e9fe590982f45045b3e53ebeab2449eca7e23a106a  luv-1.30.1-0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index e01e46aa99..31288ffca3 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.30.0-0
+LUV_VERSION = 1.30.1-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
