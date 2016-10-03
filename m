From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 3 Oct 2016 11:05:46 +0100
Subject: [Buildroot] [PATCH 2/2] mc: bump version to 4.8.18
In-Reply-To: <20161003100546.10860-1-Vincent.Riera@imgtec.com>
References: <20161003100546.10860-1-Vincent.Riera@imgtec.com>
Message-ID: <20161003100546.10860-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 0d22d80..a8116d0 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,2 +1,2 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.17.sha256:
-sha256 0447bdddc0baa81866e66f50f9a545d29d6eebb68b0ab46c98d8fddd2bf4e44d  mc-4.8.17.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.18.sha256:
+sha256 f7636815c987c1719c4f5de2dcd156a0e7d097b1d10e4466d2bdead343d5bece  mc-4.8.18.tar.xz
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 808f81c..ff4c8ad 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.17
+MC_VERSION = 4.8.18
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPLv3+
-- 
2.10.0
