From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 15:04:27 +0200
Subject: [Buildroot] [git commit] fwup: bump version to v0.8.2
Message-ID: <20160820130436.6165681E73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87d04dd2ab89243ee0d5bbbe8782de40df5549fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version brings in several bug fixes: one of which partially
addresses Buildroot autobuilder failures for static configurations.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fwup/fwup.hash | 2 +-
 package/fwup/fwup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fwup/fwup.hash b/package/fwup/fwup.hash
index 6d9a1ea..e21eff0 100644
--- a/package/fwup/fwup.hash
+++ b/package/fwup/fwup.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	  56d30f4ddf7929d693c022455978aebef1f6adb5896437a199bde43d5459da68	fwup-v0.8.0.tar.gz
+sha256   64c3a0ac38dc11c0c05b2588a89638cbc37f5552ac0f1c290f7ee5365f2bba49      fwup-v0.8.2.tar.gz
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index ae85716..3d3e3be 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FWUP_VERSION = v0.8.0
+FWUP_VERSION = v0.8.2
 FWUP_SITE = $(call github,fhunleth,fwup,$(FWUP_VERSION))
 FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
