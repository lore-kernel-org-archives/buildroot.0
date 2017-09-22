From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:28:47 +0200
Subject: [Buildroot] [git commit] package/nodm: bump version to 0.13
Message-ID: <20170922212517.4C64C810D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6a4513577a7c0590352df800aeeac7f20316d59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodm/nodm.hash | 2 +-
 package/nodm/nodm.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodm/nodm.hash b/package/nodm/nodm.hash
index e11e875..2a70c68 100644
--- a/package/nodm/nodm.hash
+++ b/package/nodm/nodm.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  840939d27d3d9b02ad09e1cffce24729bcdeee6cea6b3f0037d8ae76b49feecd  nodm-0.12-1.tar.gz
+sha256 ef11667ae82846801a9633df36c20f632cc03319bb1da35f062ac0f950771273  nodm-0.13.tar.gz
diff --git a/package/nodm/nodm.mk b/package/nodm/nodm.mk
index 4f751c3..a5afd53 100644
--- a/package/nodm/nodm.mk
+++ b/package/nodm/nodm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NODM_VERSION = 0.12-1
-NODM_SITE = $(call github,spanezz,nodm,debian/$(NODM_VERSION))
+NODM_VERSION = 0.13
+NODM_SITE = $(call github,spanezz,nodm,$(NODM_VERSION))
 NODM_LICENSE = GPL-2.0+
 NODM_LICENSE_FILES = COPYING
 NODM_AUTORECONF = YES
