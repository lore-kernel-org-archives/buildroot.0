From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 22:16:32 +0200
Subject: [Buildroot] [git commit] package/checksec: bump to 2.2.2
Message-ID: <20200602201625.9711C82AF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1e6e19def3531a53a29c91973be9808c4ad511a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/checksec/checksec.hash | 4 ++--
 package/checksec/checksec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
index 4543f62a36..397cfe381e 100644
--- a/package/checksec/checksec.hash
+++ b/package/checksec/checksec.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e50a92a2bb22d40d1aa297cd011209ab5ad0b620236dfb9a7afe4c29744260a9 checksec-2.1.0.tar.gz
-sha256 c5e2a8e188040fc34eb9362084778a2e25f8d1f888e47a2be09efa7cecd9c70d LICENSE.txt
+sha256 c5e2a8e188040fc34eb9362084778a2e25f8d1f888e47a2be09efa7cecd9c70d  LICENSE.txt
+sha256 d3c8e80bdd1cee0c2f0e60cb7a8a9482b82f651ea069e3a4453ae9a44072a632  checksec-2.2.2.tar.gz
diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
index ffa249663c..e46e858437 100644
--- a/package/checksec/checksec.mk
+++ b/package/checksec/checksec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKSEC_VERSION = 2.1.0
+CHECKSEC_VERSION = 2.2.2
 CHECKSEC_SITE = $(call github,slimm609,checksec.sh,$(CHECKSEC_VERSION))
 CHECKSEC_LICENSE = BSD-3-Clause
 CHECKSEC_LICENSE_FILES = LICENSE.txt
