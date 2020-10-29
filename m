From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Oct 2020 21:28:35 +0100
Subject: [Buildroot] [git commit] package/moarvm: bump to version 2020.10
Message-ID: <20201029215933.E6D6883916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0a213cd66d10bc13af912b21799d23713f286cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 23040d9e2d..36f0a81f31 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  da48887a1be0e397586b3470c2627d04c64d1e0caf9305ee7dc8db8db739f7cf  MoarVM-2020.07.tar.gz
+sha256  637883083f16c4398ffd3685ea6411daa605dd0862e1f59cce632bb2b994f2c4  MoarVM-2020.10.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index f49191f173..9fe5f4c077 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2020.07
+MOARVM_VERSION = 2020.10
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
