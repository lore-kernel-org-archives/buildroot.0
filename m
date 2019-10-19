From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 19 Oct 2019 20:48:03 +0200
Subject: [Buildroot] [git commit] pdbg: Bump version to v2.4
Message-ID: <20191019184216.50B628295E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99ab5630a654f333c47a0ff458862516cf73d766
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pdbg/pdbg.hash | 2 +-
 package/pdbg/pdbg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index 68c7735e19..486dff240d 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 dffeb0774dd2600b384bb42903fbbbff1396eb078f3430d129fec10ca194a4bb pdbg-2.3.tar.gz
+sha256 10f701c4bb8557a35de166c4322d77fa64ddbdd1146141a88a3d530144545820 pdbg-2.4.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 52eaddb0b4..1832e235ec 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 2.3
+PDBG_VERSION = 2.4
 PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
