From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 May 2016 14:05:32 +0200
Subject: [Buildroot] [git commit] mc: bump version to 4.8.17
Message-ID: <20160509120546.7110E804EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad08c9071d914266b6533c758414a49437c949ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index a93432b..0d22d80 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,2 +1,2 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.16.sha256:
-sha256  bbbcbe3097d3160f865d24aa38ff122f1c59752b5ef153ca4ade5ac0f82b7020  mc-4.8.16.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.17.sha256:
+sha256 0447bdddc0baa81866e66f50f9a545d29d6eebb68b0ab46c98d8fddd2bf4e44d  mc-4.8.17.tar.xz
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 05e5243..808f81c 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.16
+MC_VERSION = 4.8.17
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPLv3+
