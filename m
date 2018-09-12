From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 09:59:31 +0200
Subject: [Buildroot] [git commit] pdbg: bump to version 1.1-rc3
Message-ID: <20180912080959.75FF983FF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3df35e44c1f7e31ccef7c97efff1fd8c8ac14e1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pdbg/pdbg.hash | 2 +-
 package/pdbg/pdbg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index 39aa33e12c..53deed2c33 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2d6174d30b12cb46d24c260ecc0714a757c2cb899be3f5106c148d4c359bd319 pdbg-139ba071c222a5b0c20075f7c2265029ddd59449.tar.gz
+sha256 bb1a77b66322b6976c9a11a573cf29d59bf4179f839c0157aa1cd49db6c0f25c pdbg-pdbg-1.1-rc3.tar.gz
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index ba9aa15d02..45a1a288ee 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 139ba071c222a5b0c20075f7c2265029ddd59449
+PDBG_VERSION = pdbg-1.1-rc3
 PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
